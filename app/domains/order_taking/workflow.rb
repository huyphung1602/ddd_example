# typed: ignore

module OrderTaking
  class Workflow < StandardError
    def self.place_order(order_json)
        puts '---> Start deserializing order'
        order_hash, order_line_hashes = OrderTaking::Deserializer.order_from_json(order_json)

        # Store order to database (to map identity with the database keys)
        puts '---> Storing order from order json'
        order = Order.from_hash(order_hash, order_line_hashes)
        order.save!

        # Form the unvalidated_order from database
        puts '---> Create unvalidtaed order from database'
        unvalidated_order = order.to_domain
        puts unvalidated_order.inspect
        puts '----'

        # Validate order
        puts '---> Start validating order'
        validated_order = OrderTaking::Processes::ValidateOrder.execute(unvalidated_order)
        puts validated_order.inspect
        puts '----'

        # Store validated order
        puts '---> Update validated order to database'
        persist_order_state(validated_order)
        puts '----'

        #Priced Order
        puts '---> Start pricing order'

        priced_order = OrderTaking::Processes::PriceOrder.execute(validated_order)
        puts priced_order.inspect
        puts '----'

        # Store priced order
        puts '---> Update priced order to database'
        persist_order_state(priced_order)
        puts '----'

        priced_order
    end

    private

    def self.persist_order_state(order_state)
      ActiveRecord::Base.transaction do
        order_hash, order_line_hashes = Order.from_domain(order_state)

        order = Order.find order_state.id
        order.update(order_hash)
        order.order_lines.each do |order_line|
          order_line.update(order_line_hashes[order_line.id])
        end
      end
    end
  end
end

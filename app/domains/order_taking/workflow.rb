module OrderTaking
  class Workflow < StandardError
    def self.place_order(unvalidated_order)
      # Parse unvalidated_order from order_json


      # Store the unvalidated order
      puts('Store the unvalidated order')
      order = Order.new(Order.to_dto(unvalidated_order))
      order_lines = unvalidated_order.map do |ol|
        OrderLine.new(OrderLine.to_dto(ol))
      end

      # Validate order
      puts('Start validating order')


      # Store validated order
      puts('Store the validated order')

      # Priced Order
      puts('Start pricing order')


      # Store Priced Order
      puts('Store the priced order')


    end
  end
end

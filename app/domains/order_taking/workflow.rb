# typed: ignore

module OrderTaking
  class Workflow < StandardError
  #   def self.place_order(unvalidated_order)
  #     begin
  #       persistence_order = unvalidated_order

  #       # Validate order
  #       puts 'Start validating order'
  #       validated_order = OrderTaking::Processes::ValidateOrder.execute(unvalidated_order)
  #       persistence_order = validated_order
  #       puts '---'
  #       puts validated_order.inspect
  #       puts '---'

  #       # Priced Order
  #       puts 'Start pricing order'
  #       priced_order = OrderTaking::Processes::PriceOrder.execute(validated_order)
  #       persistence_order = priced_order
  #       puts '---'
  #       puts priced_order.inspect
  #       puts '---'

  #     ensure
  #       order = Order.new(Order.from_domain(persistence_order))
  #       order_lines = persistence_order.order_lines.map do |ol|
  #         OrderLine.new(OrderLine.from_domain(ol))
  #       end
  #       order.order_lines = order_lines

  #       ActiveRecord::Base.transaction dohttps://www.youtube.com/watch?v=X5AijdbjgIs
  #         order.save!
  #       end
  #     end
  #   end
  # end
end

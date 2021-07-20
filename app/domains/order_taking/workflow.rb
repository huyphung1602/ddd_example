# typed: ignore

# Sample
# pc1 = OrderTaking::DomainTypes::ProductCode.new(code: 'G001')
# pc2 = OrderTaking::DomainTypes::ProductCode.new(code: 'W0001')
# ol1 = OrderTaking::DomainTypes::OrderLine.new({ id: 1, order_id: 1, product_code: pc1, order_quantity: 1.5 })
# ol2 = OrderTaking::DomainTypes::OrderLine.new({ id: 2, order_id: 1, product_code: pc2, order_quantity: 3 })
# ci = OrderTaking::DomainTypes::UnvalidatedCustomerInfo.new(name: 'Dendi', email: 'den@gmail.com')
# uo =OrderTaking::DomainTypes::UnvalidatedOrder.new({ id: 1, customer_info: ci, shipping_address: '181 Cao Thang', billing_address: '181 Cao Thang', order_lines: [ol1, ol2]})

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

  #       ActiveRecord::Base.transaction do
  #         order.save!
  #       end
  #     end
  #   end
  # end
end

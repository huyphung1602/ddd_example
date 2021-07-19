# typed: strict

# Example:
# OrderTaking::DomainTypes::UnvalidatedOrder.new({ id: 1, customer_info: ci, shipping_address: '181 Cao Thang', billing_address: '181 Cao Thang', order_lines: ols})
# ol1 = OrderTaking::DomainTypes::OrderLine.new({ id: 1, order_id: 1, product_code: 'G001', order_quantity: 1.5, price: 0 })
# ol2 = OrderTaking::DomainTypes::OrderLine.new({ id: 1, order_id: 1, product_code: 'W0001', order_quantity: 3, price: 0 })

module OrderTaking::DomainTypes
  class UnvalidatedOrder < T::Struct
    prop :id, Integer
    prop :customer_info, UnvalidatedCustomerInfo
    prop :shipping_address, String
    prop :billing_address, String
    prop :order_lines, T::Array[OrderLine]
  end
end

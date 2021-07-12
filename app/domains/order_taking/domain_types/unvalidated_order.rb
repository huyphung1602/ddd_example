# typed: strict

# Example:
# OrderTaking::DomainTypes::UnvalidatedOrder.new({ id: 1, customer_info: ci, shipping_address: '181 Cao Thang', billing_address: '181 Cao Thang', order_lines: ols})

module OrderTaking::DomainTypes
  class UnvalidatedOrder < T::Struct
    prop :id, Integer
    prop :customer_info, UnvalidatedCustomerInfo
    prop :shipping_address, String
    prop :billing_address, String
    prop :order_lines, T::Array[OrderLine]
  end
end

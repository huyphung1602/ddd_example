# typed: strict

module OrderTaking::DomainTypes
  class UnvalidatedOrder < T::Struct
    prop :order_id, String
    prop :customer_info, UnvalidatedCustomerInfo
    prop :shipping_address, String
    prop :billing_address, String
    prop :order_lines, T::Array[OrderLine]
  end
end

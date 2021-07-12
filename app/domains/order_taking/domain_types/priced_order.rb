# typed: strict

module OrderTaking::DomainTypes
  class PricedOrder < T::Struct
    prop :id, Integer
    prop :customer_info, ValidatedCustomerInfo
    prop :shipping_address, String
    prop :billing_address, String
    prop :order_lines, T::Array[OrderLine]
  end
end

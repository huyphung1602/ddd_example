# typed: strict

module OrderTaking::DomainTypes
  class ValidatedOrder < T::Struct
    prop :order_id, String
    prop :customer_info, ValidatedCustomerInfo
    prop :shipping_address, String
    prop :billing_address, String
    prop :order_lines, T::Array[OrderLine]
  end
end

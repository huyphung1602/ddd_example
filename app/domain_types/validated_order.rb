# typed: strict

class ValidatedOrder < T::Struct
  prop :order_id, String
  prop :customer_info, CustomerInfo
  prop :shipping_address, T.untyped
  prop :billing_address, T.untyped
  prop :order_lines, T::Array[OrderLine]
end

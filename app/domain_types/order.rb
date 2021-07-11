# typed: strict

class Order < T::Struct
  prop :id, Integer
  prop :customer_id, Integer
  prop :billing_address, T.untyped
  prop :shipping_address, T.untyped
  prop :order_lines, T::Array[OrderLine]
  prop :amount_to_bill, T.untyped
end

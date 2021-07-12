# typed: strict

class UnvalidatedOrder < T::Struct
  prop :order_id, String
  prop :customer_info, CustomerInfo
  prop :shipping_address, T.untyped
end

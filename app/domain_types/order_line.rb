# typed: strict

class OrderLine < T::Struct
  extend T::Sig

  prop :id, Integer
  prop :order_id, Integer
  prop :product_code, ProductCode
  prop :order_quanity, T.untyped
  prop :price, T.untyped
end

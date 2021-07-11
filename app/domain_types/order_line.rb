# typed: strict

class OrderLine < T::Struct
  extend T::Sig

  prop :id, Integer
  prop :order_id, Integer
  prop :product_code, String
  prop :order_quanity, T.any(Integer, Float)
  prop :price, Integer

  sig {returns(OrderLine)}
  def value
    product_code_inst = ProductCode.new(code: product_code)
    OrderLine.new(
      id: id,
      order_id: order_id,
      product_code: product_code_inst.value,
      order_quanity: OrderQuanity.value(product_code_inst, order_quanity),
      price: price,
    )
  end
end

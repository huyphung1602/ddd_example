# typed: strict

class OrderQuanity < T::Struct
  extend T::Sig

  sig do
    params(code: ProductCode, order_quanity: T.any(Integer, Float))
      .returns(T.any(Integer, Float))
  end
  def self.value(code, order_quanity)
    if code.is_gizmo?
      T.cast(order_quanity, Float)
    elsif code.is_widget?
      T.cast(order_quanity, Integer)
    else
      order_quanity
    end
  end
end

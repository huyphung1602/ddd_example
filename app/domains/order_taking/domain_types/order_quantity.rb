# typed: strict

module OrderTaking::DomainTypes
  class OrderQuantity < T::Struct
    extend T::Sig

    sig do
      params(code: ProductCode, order_quantity: T.any(Integer, Float))
        .returns(T.any(Integer, Float))
    end
    def self.validate(code, order_quantity)
      if code.is_gizmo?
        T.cast(order_quantity, Float)
      elsif code.is_widget?
        T.cast(order_quantity, Integer)
      else
        order_quantity
      end
    end
  end
end

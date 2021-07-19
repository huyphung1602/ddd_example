# typed: strict

# Examples:
# ol1 = OrderTaking::DomainTypes::OrderLine.new({ id: 1, order_id: 1, product_code: 'G001', order_quantity: 1.5, price: 0 })
# ol2 = OrderTaking::DomainTypes::OrderLine.new({ id: 1, order_id: 1, product_code: 'W0001', order_quantity: 3, price: 0 })

module OrderTaking::DomainTypes
  class OrderLine < T::Struct
    extend T::Sig

    prop :id, Integer
    prop :order_id, Integer
    prop :product_code, String
    prop :order_quantity, T.any(Integer, Float)

    sig {returns(OrderLine)}
    def validate
      product_code_inst = ProductCode.new(code: product_code)
      OrderLine.new(
        id: id,
        order_id: order_id,
        product_code: product_code_inst.validate,
        order_quantity: Orderquantity.validate(product_code_inst, order_quantity),
      )
    end
  end
end

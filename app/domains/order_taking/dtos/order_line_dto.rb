# typed: strict
module OrderTaking::Dtos
  class OrderLineDto
    extend T::Sig

    sig {params(order_line: T.any(OrderTaking::DomainTypes::OrderLine, OrderTaking::DomainTypes::PricedOrderLine)).returns(JSON)}
    def fromDomain(order_line)
      price = order_line.is_a?(OrderTaking::DomainTypes::PricedOrderLine) ? order_line.price : nil

      JSON.generate(
        {
          order_id: order_line.order_id,
          product_code: order_line.product_code,
          order_quanity: order_line.order_quanity,
          price: price,
        }
      )
    end
  end
end
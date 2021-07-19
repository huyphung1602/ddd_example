# typed: strict
module OrderTaking::Dtos
  class OrderLineDto
    extend T::Sig

    sig {params(order_line: T.any(OrderTaking::DomainTypes::OrderLine, OrderTaking::DomainTypes::PricedOrderLine)).returns(JSON)}
    def self.fromDomain(order_line)
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

    sig {params(order_line_json: String).returns(T.any(OrderTaking::DomainTypes::OrderLine, OrderTaking::DomainTypes::PricedOrderLine))}
    def self.toDomain(order_line_json)
      parsed_order_line = JSON.parse(order_line_json)
      if parsed_order_line['price'].present?
        OrderTaking::DomainTypes::PricedOrderLine.new(parsed_order_line)
      else
        OrderTaking::DomainTypes::OrderLine.new(parsed_order_line.except(:price))
      end
    end
  end
end

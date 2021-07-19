# typed: strict

module OrderTaking::Processes
  class PriceOrder < T::Struct
    extend T::Sig
    
    sig do
      params(validated_order: OrderTaking::DomainTypes::ValidatedOrder)
        .returns(OrderTaking::DomainTypes::PricedOrder)
    end
    def self.execute(validated_order)
      priced_order_lines = validated_order.order_lines.map do |ol|
        OrderTaking::DomainTypes::PricedOrderLine.new(
          id: ol.id,
          order_id: ol.order_id,
          product_code: ol.product_code,
          order_quanity: ol.order_quanity,
          price: OrderTaking::Dependencies::GetProductPrice.get_product_price(ol.product_code)
        )
      end

      OrderTaking::DomainTypes::PricedOrder.new(
        id: validated_order.id,
        customer_info: validated_order.customer_info,
        shipping_address: validated_order.shipping_address,
        billing_address: validated_order.shipping_address,
        order_lines: priced_order_lines,
      )
    end
  end
end

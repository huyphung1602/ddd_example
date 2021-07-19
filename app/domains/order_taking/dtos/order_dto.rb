# typed: strict
module OrderTaking::Dtos
  class OrderDto
    extend T::Sig

    sig do
      params(order:
        T.any(
          OrderTaking::DomainTypes::UnvalidatedOrder,
          OrderTaking::DomainTypes::ValidatedOrder,
          OrderTaking::DomainTypes::PricedOrder,
        )
      ).returns(JSON)
    end
    def self.fromDomain(order)
      case order
      when OrderTaking::DomainTypes::ValidatedOrder
        packValidatedOrder(order)
      when OrderTaking::DomainTypes::PricedOrder
        packPricedOrder(order)
      else
        packUnvalidatedOrder(order)
      end
    end

    private

    sig {params(unvalidated_order: OrderTaking::DomainTypes::UnvalidatedOrder).returns(JSON)}
    def self.packUnvalidatedOrder(unvalidated_order)
      JSON.generate(
        {
          customer_name: unvalidated_order.customer_info.name,
          customer_email: unvalidated_order.customer_info.email,
          shipping_address: unvalidated_order.shipping_address,
          billing_address: unvalidated_order.billing_address,
          isValid: false,
          isPriced: false,
        }
      )
    end

    sig {params(validated_order: OrderTaking::DomainTypes::ValidatedOrder).returns(JSON)}
    def self.packValidatedOrder(validated_order)
      JSON.generate(
        {
          customer_name: validated_order.customer_info.name,
          customer_email: validated_order.customer_info.email,
          shipping_address: validated_order.shipping_address,
          billing_address: validated_order.billing_address,
          isValid: true,
          isPriced: false,
        }
      )
    end

    sig {params(priced_order: OrderTaking::DomainTypes::PricedOrder).returns(JSON)}
    def self.packPricedOrder(priced_order)
      JSON.generate(
        {
          customer_name: priced_order.customer_info.name,
          customer_email: priced_order.customer_info.email,
          shipping_address: priced_order.shipping_address,
          billing_address: priced_order.billing_address,
          isValid: true,
          isPriced: true,
        }
      )
    end
  end
end
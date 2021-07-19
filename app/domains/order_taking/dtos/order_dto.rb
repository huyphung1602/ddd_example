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

    sig do
      params(order_json: String).returns(
        T.any(
          OrderTaking::DomainTypes::UnvalidatedOrder,
          OrderTaking::DomainTypes::ValidatedOrder,
          OrderTaking::DomainTypes::PricedOrder,
        )
      )
    end
    def self.toDomain(order_json)
      parsed_order = JSON.parse(order_json)
      if parsed_order['is_priced']
        OrderTaking::DomainTypes::PricedOrder.new(parsed_order.except('is_priced', 'is_valid'))
      elsif parsed_order['is_valid']
        OrderTaking::DomainTypes::ValidatedOrder.new(parsed_order.except('is_priced', 'is_valid'))
      else
        OrderTaking::DomainTypes::UnvalidatedOrder.new(parsed_order.except('is_priced', 'is_valid'))
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
          is_valid: false,
          is_priced: false,
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
          is_valid: true,
          is_priced: false,
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
          is_valid: true,
          is_priced: true,
        }
      )
    end
  end
end
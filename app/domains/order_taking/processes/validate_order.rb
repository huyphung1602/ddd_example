# typed: strict

module OrderTaking::Processes
  class ValidateOrder < T::Struct
    extend T::Sig
    
    sig do
      params(
        unvalidated_order: OrderTaking::DomainTypes::UnvalidatedOrder
      ).returns(OrderTaking::DomainTypes::ValidatedOrder)
    end
    def execute(unvalidated_order)
      validated_order_lines = unvalidated_order.order_lines.map do |ol|
        OrderTaking::Dependencies::CheckProductCodeExists.check_product_code(ol.product_code)
        ol
      end

      OrderTaking::Dependencies::CheckAddressExists.check_address(unvalidated_order.shipping_address)
      OrderTaking::Dependencies::CheckAddressExists.check_address(unvalidated_order.shipping_address)

      OrderTaking::DomainTypes::ValidatedOrder.new(
        order_id: unvalidated_order.order_id,
        customer_info: validate_customer_info(unvalidated_order.customer_info),
        shipping_address: unvalidated_order.shipping_address,
        billing_address: unvalidated_order.shipping_address,
        order_lines: validated_order_lines,
      )
    end
  end

  private

  sig do
    params(
      unvalidated_customer_info: OrderTaking::DomainTypes::UnvalidatedCustomerInfo
    ).returns(OrderTaking::DomainTypes::ValidatedCustomerInfo)
  end
  def validate_customer_info(unvalidated_customer_info)
    OrderTaking::DomainTypes::ValidatedCustomerInfo.new(
      name: unvalidated_customer_info.name,
      email: unvalidated_customer_info.email,
    )
  end
end

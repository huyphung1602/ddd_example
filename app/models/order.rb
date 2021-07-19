class Order < ApplicationRecord

  def self.to_dto(order_domain)
    base_dto = {
      customer_name: order_domain.customer_info.name,
      customer_email: order_domain.customer_info.email,
      shipping_address: order_domain.shipping_address,
      billing_address: order_domain.billing_address,
      is_valid: false,
      is_priced: false,
    }

    case order_domain
    when OrderTaking::DomainTypes::ValidatedOrder
      base_dto.merge(is_valid: true, is_priced: false)
    when OrderTaking::DomainTypes::PricedOrder
      base_dto.merge(is_valid: true, is_priced: true)
    else
      base_dto
    end
  end
end

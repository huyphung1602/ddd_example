class Order < ApplicationRecord
  has_many :order_lines, dependent: :destroy

  def self.from_domain(order_domain)
    base_hash = {
      customer_name: order_domain.customer_info.name,
      customer_email: order_domain.customer_info.email,
      shipping_address: order_domain.shipping_address,
      billing_address: order_domain.billing_address,
      is_valid: false,
      is_priced: false,
    }

    case order_domain
    when OrderTaking::DomainTypes::ValidatedOrder
      base_hash.merge(is_valid: true, is_priced: false)
    when OrderTaking::DomainTypes::PricedOrder
      base_hash.merge(is_valid: true, is_priced: true)
    else
      base_hash
    end
  end
end

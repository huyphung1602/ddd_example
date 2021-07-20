class OrderLine < ApplicationRecord
  belongs_to :order

  def self.from_domain(order_line_domain)
    base_hash = {
      product_code: order_line_domain.product_code.code,
      kilo_quantity: order_line_domain.product_code.is_gizmo? ? order_line_domain.order_quantity : nil,
      unit_quantity: order_line_domain.product_code.is_widget? ? order_line_domain.order_quantity : nil,
      price: nil,
    }

    if order_line_domain.is_a? OrderTaking::DomainTypes::PricedOrderLine
      base_hash.merge(price: order_line_domain.price)
    else
      base_hash
    end
  end
end

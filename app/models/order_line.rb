class OrderLine < ApplicationRecord
  belongs_to :order

  def self.from_domain(order_lines_domain)
    order_lines_domain.reduce({}) do |hash, order_line_domain|
      price = order_line_domain.is_a?(OrderTaking::DomainTypes::PricedOrderLine) ? order_line_domain.price : nil
      hash[order_line_domain.id] = {
        product_code: order_line_domain.product_code.code,
        kilo_quantity: order_line_domain.product_code.is_gizmo? ? order_line_domain.order_quantity : nil,
        unit_quantity: order_line_domain.product_code.is_widget? ? order_line_domain.order_quantity : nil,
        price: price,
      }
      hash
    end
  end
end

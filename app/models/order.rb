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

    order_hash = case order_domain
    when OrderTaking::DomainTypes::ValidatedOrder
      base_hash.merge(is_valid: true, is_priced: false)
    when OrderTaking::DomainTypes::PricedOrder
      base_hash.merge(is_valid: true, is_priced: true)
    else
      base_hash
    end

    order_line_hashes = OrderLine.from_domain(order_domain.order_lines)
    puts order_line_hashes.inspect

    [order_hash, order_line_hashes]
  end

  def self.from_hash(order_hash, order_line_hashes)
    order_lines = order_line_hashes.map do |order_line_hash|
      OrderLine.new(order_line_hash)
    end

    Order.new(order_hash.merge(order_lines: order_lines))
  end

  def to_domain
    if self.is_priced
      build_priced_domain
    elsif self.is_valid
      build_validated_domain
    else
      build_unvalidated_domain
    end
  end

  def build_unvalidated_domain
    unvalidated_customer_info = OrderTaking::DomainTypes::UnvalidatedCustomerInfo.new(
      name: self.customer_name,
      email: self.customer_email,
    )
    order_lines = self.order_lines.map do |order_line|
      OrderTaking::DomainTypes::OrderLine.new(
        id: order_line.id,
        order_id: order_line.order_id,
        product_code: OrderTaking::DomainTypes::ProductCode.new(code: order_line.product_code),
        order_quantity: order_line.kilo_quantity || order_line.unit_quantity || 0,
      ).validate
    end
    OrderTaking::DomainTypes::UnvalidatedOrder.new(
      id: self.id,
      customer_info: unvalidated_customer_info,
      shipping_address: self.shipping_address,
      billing_address: self.billing_address,
      order_lines: order_lines
    )
  end

  def build_validated_domain
    validated_customer_info = OrderTaking::DomainTypes::ValidatedCustomerInfo.new(
      name: self.customer_name,
      email: self.customer_email,
    )
    order_lines = self.order_lines.map do |order_line|
      OrderTaking::DomainTypes::OrderLine.new(
        id: order_line.id,
        order_id: order_line.order_id,
        product_code: OrderTaking::DomainTypes::ProductCode.new(code: order_line.product_code),
        order_quantity: order_line.kilo_quantity || order_line.unit_quantity || 0,
      )
    end
    OrderTaking::DomainTypes::ValidatedOrder.new(
      id: self.id,
      customer_info: validated_customer_info,
      shipping_address: self.shipping_address,
      billing_address: self.billing_address,
      order_lines: order_lines
    )
  end

  def build_priced_domain
    validated_customer_info = OrderTaking::DomainTypes::ValidatedCustomerInfo.new(
      name: self.customer_name,
      email: self.customer_email,
    )
    order_lines = self.order_lines.map do |order_line|
      OrderTaking::DomainTypes::PricedOrderLine.new(
        id: order_line.id,
        order_id: order_line.order_id,
        product_code: OrderTaking::DomainTypes::ProductCode.new(code: order_line.product_code),
        order_quantity: order_line.kilo_quantity || order_line.unit_quantity || 0,
        price: order_line.price,
      )
    end
    OrderTaking::DomainTypes::PricedOrder.new(
      id: self.id,
      customer_info: validated_customer_info,
      shipping_address: self.shipping_address,
      billing_address: self.billing_address,
      order_lines: order_lines
    )
  end
end

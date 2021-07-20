module OrderTaking
  class Deserializer
    def self.order_from_json(order_json)
      raw_hash = order_json.deep_symbolize_keys

      order_hash = {
        customer_name: raw_hash[:customer_info][:name],
        customer_email: raw_hash[:customer_info][:email],
        shipping_address: raw_hash[:shipping_address],
        billing_address: raw_hash[:shipping_address],
      }

      order_line_hashes = raw_hash[:order_lines].map do |order_line|
        {
          product_code: order_line[:product_code],
          kilo_quantity: kilo_quantity(order_line[:product_code], order_line[:order_quantity]),
          unit_quantity: unit_quantity(order_line[:product_code], order_line[:order_quantity]),
        }
      end

      [order_hash, order_line_hashes]
    end

    private

    def self.kilo_quantity(product_code, order_quantity)
      product_code.first === 'G' ? order_quantity.to_f : nil
    end

    def self.unit_quantity(product_code, order_quantity)
      product_code.first === 'W' ? order_quantity.to_i : nil
    end
  end
end
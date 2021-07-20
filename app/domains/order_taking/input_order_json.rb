module OrderTaking
  # base class for all errors
  class InputOrderJson
    def self.success_order_json
      {
        "customer_info": {
          "name": "Dendi",
          "email": "den@gmail.com",
        },
        "shipping_address": "181 Cao Thang",
        "billing_address": "181 Cao Thang",
        "order_lines": [
          {
            "product_code": "G001",
            "order_quantity": "1.5",
          },
          {
            "product_code": "W0001",
            "order_quantity": "3",
          },
        ]
      }.to_json
    end
  end
end

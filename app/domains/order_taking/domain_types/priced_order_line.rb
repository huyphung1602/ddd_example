# typed: strict

# Examples:
# ol1 = OrderTaking::DomainTypes::OrderLine.new({ id: 1, order_id: 1, product_code: 'G001', order_quantity: 1.5, price: 0 })
# ol2 = OrderTaking::DomainTypes::OrderLine.new({ id: 1, order_id: 1, product_code: 'W0001', order_quantity: 3, price: 0 })

module OrderTaking::DomainTypes
  class PricedOrderLine < T::Struct
    extend T::Sig

    prop :id, Integer
    prop :order_id, Integer
    prop :product_code, ProductCode
    prop :order_quantity, T.any(Integer, Float)
    prop :price, Integer
  end
end

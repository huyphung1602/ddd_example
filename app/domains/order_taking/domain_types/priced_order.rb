# typed: strict

module OrderTaking::DomainTypes
  class PricedOrder < T::Struct
    extend T::Sig

    prop :id, Integer
    prop :customer_info, ValidatedCustomerInfo
    prop :shipping_address, String
    prop :billing_address, String
    prop :order_lines, T::Array[PricedOrderLine]

    sig {returns(T.any(Integer, Float))}
    def amount_to_bill
      order_lines.reduce(0) do |acc, ol|
        acc + ol.order_quanity * ol.price
      end
    end
  end
end

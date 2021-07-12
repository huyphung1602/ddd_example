# typed: strict

module OrderTaking::DomainTypes
  class PricedOrder < T::Struct
    extend T::Sig

    prop :id, Integer
    prop :customer_info, ValidatedCustomerInfo
    prop :shipping_address, String
    prop :billing_address, String
    prop :order_lines, T::Array[OrderLine]

    sig {returns(T.any(Integer, Float))}
    def amount_to_bill
      order_lines.reduce(0) do |acc, ol|
        acc + ol.order_quanity * T.cast(ol.price, Integer)
      end
    end
  end
end

# typed: strict

module OrderTaking::DomainTypes
  class UnvalidatedOrder < T::Struct
    prop :order_id, String
    prop :customer_info, CustomerInfo
    prop :shipping_address, String
  end
end

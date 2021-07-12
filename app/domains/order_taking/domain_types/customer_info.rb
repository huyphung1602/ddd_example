# typed: strict

module OrderTaking::DomainTypes
  class CustomerInfo < T::Struct
    prop :name, String
    prop :email, String
  end
end

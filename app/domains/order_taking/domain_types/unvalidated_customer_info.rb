# typed: strict

module OrderTaking::DomainTypes
  class UnvalidatedCustomerInfo < T::Struct
    prop :name, String
    prop :email, String
  end
end

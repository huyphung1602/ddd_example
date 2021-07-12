# typed: strict

module OrderTaking::DomainTypes
  class ValidatedCustomerInfo < T::Struct
    prop :name, String
    prop :email, String
  end
end

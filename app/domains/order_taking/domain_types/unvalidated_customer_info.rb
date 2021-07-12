# typed: strict

# Example:
# OrderTaking::DomainTypes::UnvalidatedCustomerInfo.new(name: 'Dendi', email: 'den@gmail.com')

module OrderTaking::DomainTypes
  class UnvalidatedCustomerInfo < T::Struct
    prop :name, String
    prop :email, String
  end
end

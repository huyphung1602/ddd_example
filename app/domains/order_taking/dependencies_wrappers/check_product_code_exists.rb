# typed: strict

module OrderTaking::DependenciesWrapper
  class CheckProductCodeExists
    extend T::Sig

    MOCK_PRODUCT_CODE = T.let({
      'G001' => true,
      'G002' => true,
      'G003' => true,
      'G004' => true,
      'W0001' => true,
      'W0002' => true,
      'W0003' => true,
      'W0004' => true,
    }.freeze, T::Hash[String, T::Boolean])

    sig {params(product_code: OrderTaking::DomainTypes::ProductCode).returns(T::Boolean)}
    def self.check_product_code(product_code)
      # sleep 10

      !!MOCK_PRODUCT_CODE[product_code.validate]
    end
  end
end

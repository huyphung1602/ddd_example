# typed: strict

module OrderTaking::Dependencies
  class GetProductPrice
    extend T::Sig

    MOCK_PRODUCT_PRICE = T.let({
      'G001' => 1000,
      'G002' => 1200,
      'G003' => 800,
      'G004' => 950,
      'W0001' => 700,
      'W0002' => 500,
      'W0003' => 1000,
      'W0004' => 1500,
    }.freeze, T::Hash[String, T::Boolean])

    sig {params(product_code: String).void}
    def self.check_product_code(product_code)
      # sleep 10

      raise StandardError.new('Product Code does not exist') unless !!MOCK_PRODUCT_PRICE[product_code]

      MOCK_PRODUCT_PRICE[product_code]
    end
  end
end

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
    }.freeze, T::Hash[String, Integer])

    sig {params(product_code: String).returns(Integer)}
    def self.get_product_price(product_code)
      # sleep 10

      raise OrderTaking::OrderTakingErrors::DependenciesError.new('Product price does not exist') unless !!MOCK_PRODUCT_PRICE[product_code]

      T.cast(MOCK_PRODUCT_PRICE[product_code], Integer)
    end
  end
end

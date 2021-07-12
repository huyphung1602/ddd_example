# typed: strict

module OrderTaking::DependenciesWrapper
  class CheckAddressExists
    extend T::Sig

    MOCK_EXISTED_ADDRESS = T.let({
      '181 Cao Thang' => true,
      '496 Gaming' => true,
      'Nha Huy Phung' => true,
    }.freeze, T::Hash[String, T::Boolean])

    sig {params(address: String).returns(T::Boolean)}
    def self.check_address(address)
      # sleep 10

      !!MOCK_EXISTED_ADDRESS[address]
    end
  end
end

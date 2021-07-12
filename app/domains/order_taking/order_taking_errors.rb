module OrderTaking::OrderTakingErrors
  # base class for all errors
  class BaseError < StandardError
  end

  class ValidationError < BaseError
  end

  class PricingError < BaseError
  end

  class DependenciesError < BaseError
  end
end

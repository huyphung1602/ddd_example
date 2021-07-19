module OrderTaking
  class Workflow < StandardError
    def PlaceOrder(unvalidated_order)
      # Store the unvalidated order
      puts('Store the unvalidated order')

      # Validate order
      puts('Start validating order')


      # Store validated order
      puts('Store the validated order')

      # Priced Order
      puts('Start pricing order')


      # Store Priced Order
      puts('Store the priced order')


    end
  end
end

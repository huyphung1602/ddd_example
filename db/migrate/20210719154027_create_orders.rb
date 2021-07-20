# typed: ignore

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :shipping_address
      t.string :billing_address
      t.boolean :is_valid, :default => false
      t.boolean :is_priced, :default => false

      t.timestamps
    end
  end
end

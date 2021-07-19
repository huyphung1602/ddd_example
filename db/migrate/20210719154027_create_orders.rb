# typed: ignore

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :shipping_address
      t.string :billing_address
      t.boolean :is_valid
      t.boolean :is_priced

      t.timestamps
    end
  end
end

# typed: ignore

class CreateOrderLines < ActiveRecord::Migration[6.1]
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.string :product_code
      t.float :kilo_quantity
      t.integer :unit_quantity
      t.integer :price

      t.timestamps
    end
  end
end

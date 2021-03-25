class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end

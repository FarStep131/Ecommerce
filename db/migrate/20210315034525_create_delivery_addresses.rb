class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :address, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :id
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :adress
      t.datetime :created_at
      t.da :updated_at

      t.timestamps
    end
  end
end

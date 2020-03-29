class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postcode, null: false
      t.string :prefecture, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building
      t.references :user
      t.timestamps
    end
  end
end

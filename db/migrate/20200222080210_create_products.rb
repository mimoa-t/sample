class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string     :image
      t.string     :name
      t.text       :description
      t.references :category,        foreign_key: true
      t.string     :size
      t.references :state,           foreign_key: true
      t.references :delivery_charge, foreign_key: true
      t.references :delivery_method, foreign_key: true
      t.references :delivery_area,   foreign_key: true
      t.references :delivery_date,   foreign_key: true
      t.string     :price
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end

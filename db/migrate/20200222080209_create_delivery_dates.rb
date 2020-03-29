class CreateDeliveryDates < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_dates do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end

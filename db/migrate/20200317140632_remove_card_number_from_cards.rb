class RemoveCardNumberFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :card_number
    remove_column :cards, :expiration_month
    remove_column :cards, :expiration_year
    remove_column :cards, :security_code
  end
end

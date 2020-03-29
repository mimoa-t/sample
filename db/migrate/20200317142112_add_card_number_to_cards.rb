class AddCardNumberToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :card_number, :string
    add_column :cards, :expiration_month, :string
    add_column :cards, :expiration_year, :string
    add_column :cards, :security_code, :string
  end
end

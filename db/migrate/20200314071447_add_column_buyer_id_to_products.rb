class AddColumnBuyerIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :buyer_id, :integer
  end
end

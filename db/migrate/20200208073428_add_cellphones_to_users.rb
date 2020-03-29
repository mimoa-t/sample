class AddCellphonesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cellphone, :integer
  end
end

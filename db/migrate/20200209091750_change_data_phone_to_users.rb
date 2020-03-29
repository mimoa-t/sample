class ChangeDataPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :phone, :string
    change_column :users, :cellphone, :string
  end
end

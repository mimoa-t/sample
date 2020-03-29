class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :familyname, :string, null: false
    add_column :users, :firstname, :string, null: false
    add_column :users, :familyname_kana, :string, null: false
    add_column :users, :firstname_kana, :string, null: false
    add_column :users, :birthday, :date, null: false
  end
end

class RemoveFamilynameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :familyname, :string
    remove_column :users, :firstname, :string
    remove_column :users, :familyname_kana, :string
    remove_column :users, :firstname_kana, :string
    remove_column :users, :birthday, :date
  end
end

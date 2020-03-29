class RenameSrcColumnToImages < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :src, :image
  end
end

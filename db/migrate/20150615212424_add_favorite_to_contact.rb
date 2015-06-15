class AddFavoriteToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite, :binary
  end
end

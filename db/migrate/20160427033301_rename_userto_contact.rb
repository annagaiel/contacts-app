class RenameUsertoContact < ActiveRecord::Migration
  def change
    rename_table :users, :contacts
  end
end

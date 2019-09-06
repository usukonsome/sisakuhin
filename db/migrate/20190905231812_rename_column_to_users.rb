class RenameColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :ip
  end
end

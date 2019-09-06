class RenameColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :name, :user_digest
  end
end

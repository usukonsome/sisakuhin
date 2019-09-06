class RenameColumnToLikes < ActiveRecord::Migration[5.1]
  def change
    remove_index :likes, :user_id
    remove_index :likes, ["user_id", "post_id"]
  end
end

class RemoveColumnToLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :user_id
  end
end

class RemoveColumnToPostsUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :user_id
  end
end

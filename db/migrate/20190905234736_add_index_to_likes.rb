class AddIndexToLikes < ActiveRecord::Migration[5.1]
  def change
    add_index :likes, :user_digest
    add_index :likes, [:post_id, :user_digest]
  end
end

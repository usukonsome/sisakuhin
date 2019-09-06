class AddIndexToPosts < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, :user_digest
  end
end

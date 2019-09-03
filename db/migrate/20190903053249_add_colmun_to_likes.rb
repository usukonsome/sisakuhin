class AddColmunToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :user_digest, :string
  end
end

class AddColumnToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :user_ip, :string
  end
end

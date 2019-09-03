class AddUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :digest, :string
  end
end

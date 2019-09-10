class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :content
      t.string :user_digest
      t.integer :post_id

      t.timestamps
    end
    add_index :replies, :user_digest
    add_index :replies, :post_id
  end
end

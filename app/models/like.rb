class Like < ApplicationRecord
  #belongs_to :user
  belongs_to :post

  validates :user_digest, presence: true
  validates :post_id, presence: true
end

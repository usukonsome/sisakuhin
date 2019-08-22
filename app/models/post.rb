class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length:{maximum: 140}
end

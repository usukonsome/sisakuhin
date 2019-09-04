class Post < ApplicationRecord
  #belongs_to :user#仕様変更により一時削除
  has_many :likes, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length:{maximum: 140}
end

class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :replies, dependent: :destroy
  mount_uploader :picture, PictureUploader
  default_scope -> {order(created_at: :desc)}
  validates :content, presence: true, length:{maximum: 140}
  validate :picture_size


  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "5MB以上の画像は投稿できません")
      end
    end
end

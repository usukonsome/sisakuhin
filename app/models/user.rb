class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, through: :likes
  #今のところ必要ない完成しても不必要なら消す。いいね先のコンテンツを直接表示ならいる
  #またはいいねを配列にしてpostをそこに代入する形ならあるいは
end

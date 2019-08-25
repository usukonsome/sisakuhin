class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, through: :likes
  #今のところ必要ない完成しても不必要なら消す。いいね先のコンテンツを直接表示ならいる
  #またはいいねを配列にしてpostをそこに代入する形ならあるいは


  def User.digest(string)
    BCrypt::Password.create(string)#ここをfooに変えてみる
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest,User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end

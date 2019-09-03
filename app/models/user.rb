class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def User.digest(string)
    BCrypt::Password.create(string)#ここをfooに変えてみる
  end#仕様変更で今は使わない

  def User.new_token
    SecureRandom.urlsafe_base64(14)
  end

  def remember
    self.digest = User.new_token
  end

  def authenticated?(string)
    BCrypt::Password.new(remember_digest).is_password?(string)
  end#仕様変更で今は使わないその2
end

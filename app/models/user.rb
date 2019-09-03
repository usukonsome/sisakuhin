class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def User.digest(string)
    BCrypt::Password.create(string)#ここをfooに変えてみる
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.digest = User.new_token
    update_attribute(:remember_digest,User.digest(digest))
  end

  def authenticated?(string)
    BCrypt::Password.new(remember_digest).is_password?(string)
  end
end

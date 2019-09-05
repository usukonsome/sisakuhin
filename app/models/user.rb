class User < ApplicationRecord
  #attr_accessor :remember_token #remenber認証が必要になったら浮上させて
  #has_many :posts, dependent: :destroy
  #has_many :likes, dependent: :destroy

  def User.digest(string)
    BCrypt::Password.create(string)#ここをfooに変えてみる
  end#結局使わない

  def User.new_token(integer)
    SecureRandom.urlsafe_base64(integer)
  end

  def remember
    self.remember_token = User.new_token(16)
    update_attribute(:remember_digest,User.digest(remember_token))
  end#結局使わない2

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end#結局使わない3

  def creating
    Post.where("name IN (SELECT digest FROM users WHERE digest = :digest)",digest: digest)
  end

  def fav
    Like.where("user_digest IN (SELECT digest FROM users WHERE digest = :digest)",digest: digest)
  end
end

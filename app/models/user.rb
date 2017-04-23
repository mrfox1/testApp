class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :password_digest, length:{minimum: 6}
end

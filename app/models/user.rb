# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :ratings
  has_many :tags, through: :posts
  has_many :comments

  validates :password_digest, length:{minimum: 6}
  validates_uniqueness_of :email

  ROLES = %w(admin manager user) # все равно, что массив
end

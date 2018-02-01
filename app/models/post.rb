# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  image      :string
#  rating     :integer
#

class Post < ApplicationRecord
  validates_presence_of :title, :body, :user
  validates_uniqueness_of :title
  validates :title, length: {minimum: 5 ,maximum: 100}
  validates :body, length: {minimum: 10, maximum: 140}


  belongs_to :user

  has_many :tags, dependent: :destroy
  has_many :ratings
  has_many :comments, dependent: :destroy

  mount_uploader :image, PostImageUploader

  scope :newest, -> {order(:created_at).reverse}


end

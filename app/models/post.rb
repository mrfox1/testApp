class Post < ApplicationRecord
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  validates :title, length:{minimum: 5,maximum: 100}
  belongs_to :user
end

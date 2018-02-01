# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post_id, uniqueness: {scope: :user_id}

  end

class Topic < ApplicationRecord
  belongs_to :shop
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end

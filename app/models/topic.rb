class Topic < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_rich_text :content
  belongs_to :shop
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  is_impressionable counter_cache: true
end

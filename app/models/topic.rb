class Topic < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_rich_text :content
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  is_impressionable counter_cache: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :image, presence: true
  validates :content, presence: true
  belongs_to :shop
end

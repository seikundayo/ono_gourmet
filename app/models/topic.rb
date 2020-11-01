class Topic < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_rich_text :content
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :admin_likes, dependent: :destroy
  has_many :liked_admins, through: :admin_likes, source: :admin
  belongs_to :shop
  is_impressionable counter_cache: true
  validates :title, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :genre, presence: true
  validates :image, presence: true
  validates :content, presence: true
end

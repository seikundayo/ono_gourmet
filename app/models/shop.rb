class Shop < ApplicationRecord
  has_many :topics
  has_many :manager_topics
  validates :name, presence: true
  validates :number, presence: true
  validates :address, presence: true
  validates :access, presence: true
  validates :time, presence: true
  validates :rest, presence: true
  validates :takeout, presence: true
  validates :map, presence: true
  validates :introduce, presence: true
  validates :shop_image, presence: true
end

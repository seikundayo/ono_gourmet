class Manager < ApplicationRecord
  mount_uploader :manager_image, ImageUploader
  has_many :manager_topic
  validates :manager_name, presence: true
  validates :manager_image, presence: true
end

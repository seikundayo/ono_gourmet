class Shop < ApplicationRecord
  has_many :topics
  has_many :manager_topics
  has_one :admin
end

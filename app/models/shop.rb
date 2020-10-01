class Shop < ApplicationRecord
  has_many :topics
  has_many :manager_topics
end

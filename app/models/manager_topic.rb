class ManagerTopic < ApplicationRecord
  has_rich_text :content
  validates :title, presence: true
  validates :content, presence: true
  validates :word, presence: true
  belongs_to :shop
  belongs_to :manager
end

class ManagerTopic < ApplicationRecord
  belongs_to :shop
  belongs_to :manager
  has_rich_text :content
  validates :title, presence: true
  validates :content, presence: true
  validates :word, presence: true
  validates :shop_id, presence: true
  validates :manager_id, presence: true
end

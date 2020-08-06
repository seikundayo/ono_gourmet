class Like < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  validates :user_id, presence: true, uniqueness: { scope: :topic_id }
  validates :topic_id, presence: true
end

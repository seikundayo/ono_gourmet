class AdminLike < ApplicationRecord
  belongs_to :admin
  belongs_to :topic
  validates :admin_id, presence: true, uniqueness: { scope: :topic_id }
  validates :topic_id, presence: true
end

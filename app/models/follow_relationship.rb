class FollowRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  validates :user_id, presence: true, uniqueness: { scope: :admin_id }
  validates :admin_id, presence: true
end

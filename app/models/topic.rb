class Topic < ApplicationRecord
  belongs_to :shop, optional: true
end

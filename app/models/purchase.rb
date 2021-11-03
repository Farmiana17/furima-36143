class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping

# validates :user_id, presence: true
# validates :item_id, presence: true
end
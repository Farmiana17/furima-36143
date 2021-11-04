class Order < ApplicationRecord
  belongs_to :item

  validates :price, presence: true

end
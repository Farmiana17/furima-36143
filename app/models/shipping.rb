class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :purchase

#  validates :post_number,   presence: true
#  validates :prefecture_id, presence: true, 
#                            numericality: { other_than: 0 , message: "can't be blank" }
#  validates :city,          presence: true
#  validates :address,       presence: true,
#                            numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
#  validates :phone,         presence: true,
#                            format: { with: , message: "is invalid. Input half-width characters" }
end
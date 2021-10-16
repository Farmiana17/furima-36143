class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :spend_day
  has_one :order_info

  belongs_to :user
  has_one_attached :image

  validates :image,           presence: true
  validates :item_name,       presence: true
  validates :item_detail,     presence: true
  validates :price,           presence: true,
                              format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" },
                              numericality: { only_integer: true, 
                              greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, 
                              message: 'is out of setting range' }                                              
  validates :category_id,     presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :item_state_id,   presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :prefecture_id,   presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :spend_day_id,    presence: true, numericality: { other_than: 0 , message: "can't be blank" }

end
class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :address, :building, :phone
  attr_accessor :price, :token
    
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows(e.g. 123-4567)" }
    validates :city
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "is too short" }
    validates :price, numericality: { only_integer: true }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_number: post_number, prefecture_id: prefecture_id,
                    city: city, address: address, building: building, phone: phone,
                    purchase_id: purchase.id)
  end

end
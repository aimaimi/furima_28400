class OrderItem

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :Address
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,address: address,building: building,phone_number: phone_number,item_id: item_id)
    Order.create(user_id: user_id,item_id: item_id)
  end
end
class OrderItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id

  include_hyphen = /\A\d{3}[-]\d{4}\z/
  only_number = /\A\d{,11}\z/
  card_number = /\A\d{14,16}\z/
  month_year = /\A\d{2}\z/
  cvc_number = /\A\d{3,4}\z/

  validates :postal_code, format: { with: include_hyphen, message: 'にはハイフン(-)を含めてください' }
  validates :phone_number, format: { with: only_number, message: 'にはハイフンを含めないでください' }

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, item_id: item_id)
  end
end

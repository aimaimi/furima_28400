class OrderItem

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id

  include_hyphen = /\A\d{3}[-]\d{4}\z/
  only_number = /\A\d{,11}\z/
  card_number = /\A\d{14,16}\z/
  month_year = /\A\d{2}\z/
  cvc_number = /\A\d{3,4}\z/

  validates :postal_code, format: {with: include_hyphen, message: "is invalid.Include hyphen(-)"}
  validates :phone_number, format: {with: only_number, message: "is invalid.Don't include hyphen(-)"}
  validates :number, format: {with: card_number}
  validates :exp_month, format: {with: month_year}
  validates :exp_year, format: {with: month_year}
  validates :cvc, format: {with: cvc_number}

  with_options presence: true do
    validates :number
    validates :exp_month
    validates :exp_year
    validates :cvc
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
class Address < ApplicationRecord
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :Address
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 }
end

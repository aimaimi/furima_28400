class Item < ApplicationRecord

  belongs_to :user
  has_one :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :price
    validates :name
    validates :explanation
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :days_until_shipping_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
end

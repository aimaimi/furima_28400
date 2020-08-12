class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping
  
  has_one_attached :image

  validates :price, :name, :explanation, :category, :status, :shipping_fee, :shipping_area, :days_until_shipping, presence: true

  validates :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :days_until_shipping_id, numericality: { other_than: 1}

  validates :price, numericality: { only_integer: true,greater_than:299, less_than:10000000 }
end

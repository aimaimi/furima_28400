class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping
  
  validates :price, :name, :explanation, :category, :status, :shipping_fee, :shipping_area, :days_until_shipping, presence: true

  validates :category, :status, :shipping_fee, :shipping_area, :days_until_shipping, numericality: { other_than: 1}
end
FactoryBot.define do
  factory :item do
    price { 2000 }
    name { 'イ' }
    explanation { 'ウ' }
    category_id { 2 }
    status_id { 2 }
    shipping_fee_id { 2 }
    shipping_area_id { 2 }
    days_until_shipping_id { 2 }
    user_id { 1 }
  end
end


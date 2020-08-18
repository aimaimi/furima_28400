FactoryBot.define do
  factory :order_item do
    postal_code { "123-4567"}
    prefecture_id { 2 }
    city { "豊島区" }
    address { "池袋" }
    building { "柳" }
    phone_number { "09012345678" }
    item_id { 12 }
    user_id { 1 }
  end
end

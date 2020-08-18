require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "商品購入情報の保存" do
    before do
      @order_item = FactoryBot.build(:order_item)
    end

    it "全ての値が正しく入力されていれば保存できること" do
      expect(@order_item).to be_valid
    end
    it "postal_codeが空だと保存ができないこと" do
      @order_item.postal_code = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Postal code can't be blank")
    end
    it "prefecture_idが1だと保存ができないこと" do
      @order_item.prefecture_id = 1
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "cityが空だと保存ができないこと" do
      @order_item.city = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空だと保存ができないこと" do
      @order_item.address = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Address can't be blank")
    end
    it "buildingが空でも保存ができること" do
      @order_item.building = nil
      expect(@order_item).to be_valid
    end
    it "phone_numberが空だと保存ができないこと" do
      @order_item.phone_number = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it "postal_codeにはハイフンが必要であること" do
      @order_item.postal_code = "1234567"
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Postal code is invalid.Include hyphen(-).")
    end
    it "phone_numberにはハイフンが不要であること" do
      @order_item.phone_number = "090-1234-5678"
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Phone number is invalid.Don't include hyphen(-) or Phone number is within 11 digits.")
    end
    it "phone_numberは11桁以内であること" do
      @order_item.phone_number = "090123456789"
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Phone number is invalid.Don't include hyphen(-) or Phone number is within 11 digits.")
    end
  end
end

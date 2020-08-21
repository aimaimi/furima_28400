require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_item = FactoryBot.build(:order_item)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@order_item).to be_valid
    end
    it 'postal_codeが空だと保存ができないこと' do
      @order_item.postal_code = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'prefecture_idが1だと保存ができないこと' do
      @order_item.prefecture_id = 1
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include('都道府県を選択してください')
    end
    it 'cityが空だと保存ができないこと' do
      @order_item.city = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'addressが空だと保存ができないこと' do
      @order_item.address = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("番地を入力してください")
    end
    it 'buildingが空でも保存ができること' do
      @order_item.building = nil
      expect(@order_item).to be_valid
    end
    it 'phone_numberが空だと保存ができないこと' do
      @order_item.phone_number = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'postal_codeにはハイフンが必要であること' do
      @order_item.postal_code = '1234567'
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include('郵便番号にはハイフン(-)を含めてください')
    end
    it 'phone_numberにはハイフンが不要であること' do
      @order_item.phone_number = '090-1234-5678'
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("電話番号にはハイフンを含めないでください")
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/free.jpg')
    end

    it 'imageとpriceとnameとexplanationとcategory_idとstatus_idとshipping_fee_idとshipping_area_idとdays_until_shipping_idとuser_idがあれば出品できる' do
      expect(@item).to be_valid
    end
    it 'nameが空では出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end
    it 'priceが空では出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('価格を入力してください')
    end
    it 'imageが空では出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('画像を入力してください')
    end
    it 'explanationが空では出品できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end
    it 'category_idが1では出品できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end
    it 'status_idが1では出品できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end
    it 'shipping_fee_idが1では出品できないこと' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end
    it 'shipping_area_idが1では出品できないこと' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end
    it 'days_until_shipping_idが1では出品できないこと' do
      @item.days_until_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end
    it 'priceが３００円以上であること' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は299より大きい値にしてください')
    end
    it 'priceが９，９９９，９９９円以下であること' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は10000000より小さい値にしてください')
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  context '新規登録できるとき' do

    it 'image, item_name、item_detail、price、categoly_id、item_state_id、delivery_fee_id、prefecture_id、spend_day_idを入力すれば登録ができる' do
      expect(@item).to be_valid
    end

  end

  context '新規登録できないとき' do

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'item_nameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    
    it 'item_detailが空では登録できない' do
      @item.item_detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item detail can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceに全角数字が含まれていると登録できない' do
      @item.price = '３00'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end

    it 'priceに全角文字が含まれていると登録できない' do
      @item.price = 'あ00'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end

    it 'priceに全角記号が含まれていると登録できない' do
      @item.price = '！00'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end

    it 'priceに半角英字が含まれていると登録できない' do
      @item.price = 'a00'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end

    it 'priceに半角記号が含まれていると登録できない' do
      @item.price = '!00'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end

    it 'category_idが選択されていないと登録できない' do
      @item.category_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'item_state_idが選択されていないと登録できない' do
      @item.item_state_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item state can't be blank")
    end

    it 'delivery_fee_idが選択されていないと登録できない' do
      @item.delivery_fee_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it 'prefecture_idが選択されていないと登録できない' do
      @item.prefecture_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'spend_day_idが選択されていないと登録できない' do
      @item.spend_day_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Spend day can't be blank")
    end

  end

end
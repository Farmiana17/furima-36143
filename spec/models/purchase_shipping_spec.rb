require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '購入情報の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numberが空だと購入できない' do
        @purchase_shipping.post_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post number can't be blank")
      end

      it 'post_numberが半角ハイフンを含む形でなければ購入できない' do
        @purchase_shipping.post_number = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post number is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'prefecture_idを選択していないと購入できない' do
        @purchase_shipping.prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it 'phoneが空だと購入できない' do
        @purchase_shipping.phone = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが9桁以下だと購入できない' do
        @purchase_shipping.phone = '090123456'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone is too short")
      end

      it 'phoneが12桁以上だと購入できない' do
        @purchase_shipping.phone = '090123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone is too long")
      end

      it 'phoneに半角数字以外が含まれていると購入できない' do
        @purchase_shipping.phone = '０9012345678'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone is invalid. Input only number")
      end

      it 'userが紐付いていないと購入できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと購入できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

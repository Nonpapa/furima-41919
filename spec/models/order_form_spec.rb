require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = OrderForm.new(user_id: @user.id, item_id: @item.id,
                                postal_code: '123-4567', prefecture_id: 2, city: '札幌市',
                                address: '南1条', building: 'さっぽろビル', phone_number: '09012345678',
                                token: 'tok_abcdefghijk00000000000000000')
  end

  describe '商品購入' do
    context '購入できるとき' do
      it 'すべて正しく入力されていれば購入できる' do
        expect(@order_form).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_form.building = ''
        @order_form.valid?
        expect(@order_form).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空だと購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」でないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が「1」（未選択）だと購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上だと購入できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

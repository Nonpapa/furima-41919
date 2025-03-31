require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができるとき' do
    it 'すべての項目が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品ができないとき' do
    it '商品画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが「---」では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category を選択してください')
    end

    it '商品の状態が「---」では出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition を選択してください')
    end

    it '配送料の負担が「---」では出品できない' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status を選択してください')
    end

    it '発送元の地域が「---」では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture を選択してください')
    end

    it '発送までの日数が「---」では出品できない' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery を選択してください')
    end

    it '価格が空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間で入力してください')
    end

    it '価格が9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間で入力してください')
    end

    it '価格が全角数字では出品できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間で入力してください')
    end

    it '価格が半角英字では出品できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間で入力してください')
    end

    it '価格が半角英数字混合では出品できない' do
      @item.price = '300yen'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間で入力してください')
    end

    it 'ユーザーが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end

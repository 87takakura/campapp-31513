require 'rails_helper'

RSpec.describe Camppost, type: :model do
  before do
    @camppost = FactoryBot.build(:camppost)
  end

  describe '記事新規投稿' do
    context '投稿できないとき' do
      it 'imageが存在しなければ保存できない' do
        @camppost.image = nil
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが存在しなければ保存できない' do
        @camppost.name = ''
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include("Name can't be blank")
      end
      it 'informationが存在しなければ保存できない' do
        @camppost.information = ''
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include("Information can't be blank")
      end
      it 'prefectureのidが1では保存できない' do
        @camppost.prefecture_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが存在しなければ保存できない' do
        @camppost.city = ''
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include("City can't be blank")
      end
      it 'watersupplyのidが1では保存できない' do
        @camppost.watersupply_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Watersupply Select')
      end
      it 'outletのidが1では保存できない' do
        @camppost.outlet_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Outlet Select')
      end
      it 'fireのidが1では保存できない' do
        @camppost.fire_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Fire Select')
      end
      it 'cargetinのidが1では保存できない' do
        @camppost.cargetin_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Cargetin Select')
      end
      it 'toiletのidが1では保存できない' do
        @camppost.toilet_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Toilet Select')
      end
      it 'bathのidが1では保存できない' do
        @camppost.bath_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Bath Select')
      end
      it 'parkingのidが1では保存できない' do
        @camppost.parking_id = 1
        @camppost.valid?
        expect(@camppost.errors.full_messages).to include('Parking Select')
      end
    end

    context '投稿できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@camppost).to be_valid
      end
      it 'campsitenameは空でも保存できる' do
        @camppost.phone_number = ''
        expect(@camppost).to be_valid
      end
      it 'phone_numberは空でも保存できる' do
        @camppost.phone_number = ''
        expect(@camppost).to be_valid
      end
      it 'web_siteは空でも保存できる' do
        @camppost.web_site = ''
        expect(@camppost).to be_valid
      end
    end
  end
end
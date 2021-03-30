FactoryBot.define do
  factory :camppost do
    name { "記事名" }
    information { "アアアアアアアアアアアア" }
    prefecture_id { 2 }
    city { '北海道青森市岩手町1丁目2-3' }
    watersupply_id { 2 }
    outlet_id { 2 }
    fire_id { 2 }
    cargetin_id { 2 }
    toilet_id { 2 }    
    bath_id { 2 } 
    parking_id { 2 }
    phone_number { '08012345678' }
    web_site { 'sample.co.jp' }
    association :user

   #ダミーデータに画像を添付する 
   after(:build) do |message|
    message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
   end
  end
end

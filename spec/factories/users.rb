FactoryBot.define do
  factory :user do
    username { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { "1a" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    prefecture_id { 2 }
   profile { 'アイウエオaiueo' } 
  end
end

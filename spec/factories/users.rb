FactoryBot.define do
  factory :user do
    nickname { 'ア' }
    second_name { 'イ' }
    first_name { 'ウ' }
    second_kana { 'アイウエオ' }
    first_kana { 'カキクケコ' }
    birthday { '2020-01-01' }
    email { Faker::Internet.free_email }
    password = '123abc'
    password { password }
    password_confirmation { password }
  end
end

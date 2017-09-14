FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    title { Faker::Lorem.word }
    email 'foo@bar.com'
    password 'foobar'
  end
end

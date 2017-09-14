FactoryGirl.define do
  factory :member do
    name { Faker::StarWars.character }
    order 1
    room_id nil
  end
end

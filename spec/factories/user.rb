FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password "testtest"
    password_confirmation "testtest"
  end
end
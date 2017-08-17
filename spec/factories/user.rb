FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email { FFaker::Internet.email }
    password "qwerqwer"
  end
end

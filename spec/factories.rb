FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email { FFaker::Internet.email }
    password "qwerqwer"
  end

  factory :book do
    title FFaker::Book.title
    author FFaker::Book.author
    description FFaker::Book.description
    borrower { create :user }
    user { create :user }
  end
end
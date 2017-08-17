FactoryGirl.define do
  factory :book do
    title FFaker::Book.title
    author FFaker::Book.author
    description FFaker::Book.description
    borrower { create :user }
    user { create :user }
  end
end

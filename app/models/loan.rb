class Loan < ApplicationRecord
  #belongs_to :borrower, class_name: :User, foreign_key: :borrower_id, optional: true
  belongs_to :book
  belongs_to :user

end

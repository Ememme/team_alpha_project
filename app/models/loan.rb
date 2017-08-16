# frozen_string_literal: true
class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :user
end

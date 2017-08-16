# frozen_string_literal: true

class Book < ApplicationRecord
  STATUS_BORROWED = 1
  STATUS_RETURNED = 0

  mount_uploader :cover, CoverUploader

  belongs_to :user, class_name: :User
  has_many :loans

  validates :title, presence: { message: "can't be blank" }
  validates :author, presence: { message: "can't be blank" }

  acts_as_votable

  def to_borrow?(current_user)
    allowed_to_borrow = loans.empty? || loans.last.status == STATUS_RETURNED
    user != current_user && allowed_to_borrow
  end

  def not_to_borrow?(current_user)
    user == current_user && (loans.empty? || loans.last.status == STATUS_RETURNED)
  end

  def to_return?(current_user)
    loans.last.status == STATUS_BORROWED && user == current_user
  end
end

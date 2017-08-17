# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books
  has_many :loans

  validates :login, presence: { message: "can't be blank" }

  acts_as_votable

  def currently_borrowed
    loans.where(status: Book::STATUS_BORROWED).order(created_at: :desc).uniq { |l| l.book_id }
  end
end

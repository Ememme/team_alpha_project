class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, class_name: :Book
  has_many :borrowed_books, class_name: :Book, foreign_key: :borrower_id

  #scope :books_to_borrow, -> { books.where(borrower_id: nil) }
  #scope :my_borrowed_books, -> { books.where.not(borrower_id: nil) }
end

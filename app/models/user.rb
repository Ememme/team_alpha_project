class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books
  has_many :loans

  #scope :books_to_lend, where(user_id: :current_user)
  #scope :borrowed_books, -> { books.where(user_id: :user.id) }
  #scope :my_borrowed_books, -> { books.where.not(borrower_id: nil) }
end

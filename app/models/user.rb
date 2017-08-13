class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :own_books, class_name: :Book, foreign_key: :owner_id
  has_many :borrowed_books, class_name: :Book, foreign_key: :borrower_id

end

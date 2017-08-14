class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader
  #belongs_to :borrower, class_name: :User, foreign_key: :borrower_id, optional: true
  belongs_to :user, class_name: :User
  has_many :loans

  # def book_status
  #   if borrower_id == nil
  #     @book_status = 0
  #   else
  #     @book_status = 1
  #   end
  # end
  #
  # def change_book_status
  #   if borrower_id != nil
  #     borrower_id = nil
  #   end
  # end
end

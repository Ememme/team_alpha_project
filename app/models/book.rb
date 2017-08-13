class Book < ApplicationRecord
  belongs_to :borrower, class_name: :User, foreign_key: :borrower_id
  belongs_to :owner, class_name: :User,  foreign_key: :owner_id

  def book_status
    if borrower_id == nil
      @book_status = 0
    else
      @book_status = 1
    end
  end

  def change_book_status
    if borrower_id != nil
      borrower_id = nil
    end
  end

end

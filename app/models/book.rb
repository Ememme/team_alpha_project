class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader

  belongs_to :user, class_name: :User
  has_many :loans

  validates :title, presence: { message: "can't be blank" }
  validates :author, presence: { message: "can't be blank" }

  acts_as_votable

  def borrowed?
    loans.empty?|| loans.last.status == 0
  end

  STATUS_BORROWED = 1
  STATUS_RETURNED = 0

end

class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader
  #belongs_to :borrower, class_name: :User, foreign_key: :borrower_id, optional: true
  belongs_to :user, class_name: :User
  has_many :loans

  acts_as_votable


end

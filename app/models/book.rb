class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader
  belongs_to :user, class_name: :User
  has_many :loans

  validates :title, presence: { message: "can't be blank" }
  validates :author, presence: { message: "can't be blank" }

  acts_as_votable

end

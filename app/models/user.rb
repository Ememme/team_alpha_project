# frozen_string_literal: true
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books
  has_many :loans

  # TODO validates :login, presence: { message: "can't be blank" }

  acts_as_votable

end

class Instructor < ApplicationRecord
  has_many :courses_instructors
  has_many :courses, through: :courses_instructors

  # validates :email, unique: true
  validates :first_name, :last_name, presence: true
end

class Instructor < ApplicationRecord
  has_many :course_instructors
  has_many :courses, through: :course_instructors
  has_many :evaluations

  # validates :email, unique: true
  validates :first_name, :last_name, presence: true
end

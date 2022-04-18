class Course < ApplicationRecord
  has_many :courses_instructors
  has_many :instructors, through: :courses_instructors

  validates :title, :number, :year, :section, :quarter, presence: true
end

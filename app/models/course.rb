class Course < ApplicationRecord
  has_many :course_instructors
  has_many :instructors, through: :course_instructors
  has_one :bid_history

  validates :title, :number, :year, :section, :quarter, presence: true
end

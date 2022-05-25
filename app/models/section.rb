class Section < ApplicationRecord
  has_many :course_instructors
  has_many :instructors, through: :course_instructors
  has_may :bid_histories
  has_many :evaluations

  validates :title, :number, :year, :section, :quarter, presence: true
end

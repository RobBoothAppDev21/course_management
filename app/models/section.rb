class Section < ApplicationRecord
  has_many :instructor_sections
  has_many :instructors, through: :instructor_sections
  has_one :bid_history
  has_many :evaluations

  validates :number, :year, :section, :quarter, presence: true
end

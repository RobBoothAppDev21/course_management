class Section < ApplicationRecord
  has_many :sections_instructors
  has_many :instructors, through: :sections_instructors
  has_may :bid_histories
  has_many :evaluations

  validates :title, :number, :year, :section, :quarter, presence: true
end

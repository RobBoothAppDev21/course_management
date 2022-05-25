class Instructor < ApplicationRecord
  has_many :sections_instructors
  has_many :sections, through: :sections_instructors
  has_many :evaluations

  # validates :email, unique: true
  validates :first_name, :last_name, presence: true
end

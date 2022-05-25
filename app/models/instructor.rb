class Instructor < ApplicationRecord
  has_many :instructor_sections
  has_many :sections, through: :instructor_sections
  has_many :evaluations

  # validates :email, unique: true
  validates :first_name, :last_name, presence: true
end

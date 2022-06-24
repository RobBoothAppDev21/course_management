# == Schema Information
#
# Table name: instructors
#
#  id            :bigint           not null, primary key
#  first_name    :string
#  last_name     :string
#  title         :string
#  department    :string           default("Faculty")
#  phone_number  :string
#  email         :string
#  academic_area :string           default("TBD")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  searchable    :text
#
class Instructor < ApplicationRecord
  has_many :instructor_sections
  has_many :sections, through: :instructor_sections
  has_many :evaluations

  # validates :email, unique: true
  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_searchable
    self.searchable = [first_name, last_name, full_name].join(' ')
  end
end

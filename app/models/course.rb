# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  number      :string           not null
#  description :string           default("TBD")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
  has_many :sections #, -> { where academic_year: '2021-2022' }

  has_many :current_sections, -> { current }, class_name: 'Section'

  # A course has many evaluations through sections
  # A course has many bid_histories through sections
end

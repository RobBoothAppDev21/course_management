# == Schema Information
#
# Table name: instructor_sections
#
#  id            :bigint           not null, primary key
#  section_id    :bigint           not null
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class InstructorSection < ApplicationRecord
  belongs_to :section
  belongs_to :instructor
end

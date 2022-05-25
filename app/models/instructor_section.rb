class InstructorSection < ApplicationRecord
  belongs_to :section
  belongs_to :instructor
end

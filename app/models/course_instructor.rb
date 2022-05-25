class CourseInstructor < ApplicationRecord
  belongs_to :section
  belongs_to :instructor
end

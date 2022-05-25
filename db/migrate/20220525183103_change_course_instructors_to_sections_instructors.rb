class ChangeCourseInstructorsToSectionsInstructors < ActiveRecord::Migration[7.0]
  def up
    rename_table :course_instructors, :sections_instructors
  end

  def down
    rename_table :sections_instructors, :course_instructors
  end
end

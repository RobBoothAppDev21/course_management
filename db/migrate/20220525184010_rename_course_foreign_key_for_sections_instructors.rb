class RenameCourseForeignKeyForSectionsInstructors < ActiveRecord::Migration[7.0]
  def up
    rename_column :sections_instructors, :course_id, :section_id
  end

  def down
    rename_column :sections_instructors, :section_id, :course_id
  end
end

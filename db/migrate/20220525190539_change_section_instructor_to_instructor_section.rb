class ChangeSectionInstructorToInstructorSection < ActiveRecord::Migration[7.0]
  def up
    remove_index :sections_instructors, :instructor_id
    remove_index :sections_instructors, :section_id
    rename_table :sections_instructors, :instructor_sections
    add_index :instructor_sections, :instructor_id
    add_index :instructor_sections, :section_id
  end

  def down
    remove_index :instructor_sections, :instructor_id
    remove_index :instructor_sections, :section_id
    rename_table :instructor_sections, :sections_instructors
    add_index :sections_instructors, :instructor_id
    add_index :sections_instructors, :section_id
  end
end

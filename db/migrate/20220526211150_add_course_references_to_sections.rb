class AddCourseReferencesToSections < ActiveRecord::Migration[7.0]
  def up
    add_reference :sections, :course, foreign_key: true
  end

  def down
    remove_reference :sections, :course
  end
end

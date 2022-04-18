class CreateCourseInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :course_instructors do |t|
      t.references :course, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true

      t.timestamps
    end
  end
end

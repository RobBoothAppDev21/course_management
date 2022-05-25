class ChangeCourseToSection < ActiveRecord::Migration[7.0]
  def change
    rename_table :courses, :sections
  end
end

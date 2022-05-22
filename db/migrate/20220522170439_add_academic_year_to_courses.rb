class AddAcademicYearToCourses < ActiveRecord::Migration[7.0]
  def up
    add_column :courses, :academic_year, :string
  end

  def down
    remove_column :courses, :academic_year
  end
end

class RenameColumnsInEvaluations < ActiveRecord::Migration[7.0]
  def change
    rename_column :evaluations, :title, :course_title
    rename_column :evaluations, :quarter, :course_quarter
    rename_column :evaluations, :year, :course_year
  end
end

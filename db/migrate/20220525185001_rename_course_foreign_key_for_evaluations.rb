class RenameCourseForeignKeyForEvaluations < ActiveRecord::Migration[7.0]
  def up
    rename_column :evaluations, :course_id, :section_id
  end

  def down
    rename_column :evaluations, :section_id, :course_id
  end
end

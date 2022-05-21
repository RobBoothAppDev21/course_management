class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.string :title
      t.string :course_number
      t.string :course_section
      t.string :quarter
      t.string :year
      t.string :instr_first_name
      t.string :instr_last_name
      t.integer :invited, default: 0
      t.integer :responded, default: 0
      t.float :percent_responded, default: 0, precision: 5, scale: 2
      t.float :hours_committed, default: 0
      t.float :material_conveyed_clear_score, default: 0
      t.float :material_conveyed_interesting_score, default: 0
      t.float :useful_tools_concepts_insights_score, default: 0
      t.float :useful_course_overall_score, default: 0
      t.float :recommendation_score, default: 0

      t.timestamps
    end
  end
end

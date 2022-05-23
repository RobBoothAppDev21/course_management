class AddReferencesToEvaluations < ActiveRecord::Migration[7.0]
  def change
    add_reference :evaluations, :course, foreign_key: true
    add_reference :evaluations, :instructor, foreign_key: true
  end
end

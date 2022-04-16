class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :number
      t.string :section
      t.string :year
      t.string :quarter
      t.boolean :sunday, default: false
      t.boolean :monday, default: false
      t.boolean :tuesday, default: false
      t.boolean :wednesday, default: false
      t.boolean :thursday, default: false
      t.boolean :friday, default: false
      t.boolean :saturday, default: false
      t.string :start_time
      t.string :end_time
      t.string :building, default: 'TBA'
      t.string :room, default: 'TBA'
      t.integer :credits, default: 100
      t.string :syllabus
      t.string :program

      t.timestamps
    end
  end
end

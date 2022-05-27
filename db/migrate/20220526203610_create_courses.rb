class CreateCourses < ActiveRecord::Migration[7.0]
  def up
    create_table :courses do |t|
      t.string :title, unique: true, null: false
      t.string :number, unique: true, null: false
      t.string :description, default: 'TBD'

      t.timestamps
    end
  end

  def down
    drop_table :courses
  end
end

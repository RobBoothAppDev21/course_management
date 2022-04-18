class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :department, default: 'Faculty'
      t.string :phone_number
      t.string :email, unique: true
      t.string :academic_area, default: 'TBD'

      t.timestamps
    end
  end
end

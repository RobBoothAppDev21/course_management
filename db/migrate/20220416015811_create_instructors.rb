class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :department
      t.string :phone_number
      t.string :email, unique: true

      t.timestamps
    end
  end
end

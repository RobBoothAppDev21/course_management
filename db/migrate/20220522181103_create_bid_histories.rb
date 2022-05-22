class CreateBidHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :bid_histories do |t|
      t.string :course_number
      t.string :course_section
      t.string :course_title
      t.string :course_quarter
      t.string :course_year
      t.string :day_time
      t.string :instructor
      t.integer :phase1_enrollment, default: 0
      t.integer :phase1_seats_available, default: 0
      t.integer :phase1_price, default: 0
      t.integer :phase2_enrollment, default: 0
      t.integer :phase2_seats_available, default: 0
      t.integer :phase2_price, default: 0
      t.integer :phase1_new_students_enrollment, default: 0
      t.integer :phase1_new_students_seats_available, default: 0
      t.integer :phase1_new_students_price, default: 0
      t.integer :phase2_new_students_enrollment, default: 0
      t.integer :phase2_new_students_seats_available, default: 0
      t.integer :phase2_new_students_price, default: 0
      t.integer :phase3_enrollment, default: 0
      t.integer :phase3_seats_available, default: 0
      t.integer :phase3_price, default: 0

      t.timestamps
    end
  end
end

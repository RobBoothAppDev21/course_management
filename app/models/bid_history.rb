# == Schema Information
#
# Table name: bid_histories
#
#  id                                  :bigint           not null, primary key
#  course_number                       :string
#  course_section                      :string
#  course_title                        :string
#  course_quarter                      :string
#  course_year                         :string
#  day_time                            :string
#  instructor                          :string
#  phase1_enrollment                   :integer          default(0)
#  phase1_seats_available              :integer          default(0)
#  phase1_price                        :integer          default(0)
#  phase2_enrollment                   :integer          default(0)
#  phase2_seats_available              :integer          default(0)
#  phase2_price                        :integer          default(0)
#  phase1_new_students_enrollment      :integer          default(0)
#  phase1_new_students_seats_available :integer          default(0)
#  phase1_new_students_price           :integer          default(0)
#  phase2_new_students_enrollment      :integer          default(0)
#  phase2_new_students_seats_available :integer          default(0)
#  phase2_new_students_price           :integer          default(0)
#  phase3_enrollment                   :integer          default(0)
#  phase3_seats_available              :integer          default(0)
#  phase3_price                        :integer          default(0)
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  section_id                          :bigint
#
class BidHistory < ApplicationRecord
  belongs_to :section
end

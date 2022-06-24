# == Schema Information
#
# Table name: courses
#
#  id                             :bigint           not null, primary key
#  title                          :string           not null
#  number                         :string           not null
#  description                    :string           default("TBD")
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  sections_count                 :integer
#  credits                        :integer          default(0)
#  searchable                     :text
#  searchable_avg_hours_committed :decimal(, )      default(0.0)
#  searchable_avg_overall_score   :decimal(, )      default(0.0)
#  searchable_ratio_overall_hours :decimal(, )      default(0.0)
#  searchable_course_areas_list   :string
#  searchable_concentrations_list :string
#
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

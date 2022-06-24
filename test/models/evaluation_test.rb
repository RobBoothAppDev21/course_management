# == Schema Information
#
# Table name: evaluations
#
#  id                                   :bigint           not null, primary key
#  course_title                         :string
#  course_number                        :string
#  course_section                       :string
#  course_quarter                       :string
#  course_year                          :string
#  instr_first_name                     :string
#  instr_last_name                      :string
#  invited                              :integer          default(0)
#  responded                            :integer          default(0)
#  percent_responded                    :float            default(0.0)
#  hours_committed                      :float            default(0.0)
#  material_conveyed_clear_score        :float            default(0.0)
#  material_conveyed_interesting_score  :float            default(0.0)
#  useful_tools_concepts_insights_score :float            default(0.0)
#  useful_course_overall_score          :float            default(0.0)
#  recommendation_score                 :float            default(0.0)
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#  section_id                           :bigint
#  instructor_id                        :bigint
#  searchable                           :text
#
require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

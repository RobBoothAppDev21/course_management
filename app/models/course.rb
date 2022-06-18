# == Schema Information
#
# Table name: courses
#
#  id             :bigint           not null, primary key
#  title          :string           not null
#  number         :string           not null
#  description    :string           default("TBD")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sections_count :integer
#  credits        :integer          default(0)
#
class Course < ApplicationRecord
  has_many :sections # , -> { where academic_year: '2021-2022' }

  # has_many :current_sections, -> { current_academic_year }, class_name: 'Section'

  # A course has many evaluations through sections
  # A course has many bid_histories through sections

  def self.current_sections
    joins(:sections).where(sections: { academic_year: '2021-2022' })
  end

  def max_five_evaluations
    evaluation_holder = []
    sections.sorted_sections.each do |section|
      break if evaluation_holder.length == 5
      section_evaluation = section.evaluations.first
      evaluation_holder << section_evaluation unless section_evaluation.nil?
    end
    evaluation_holder
  end

  def  calculate_average_overall_score
    evaluations = max_five_evaluations
    return 'N/A' if evaluations.empty?
    num_of_evaluations = evaluations.length
    sum_of_overall_score = 0
    evaluations.each do |evaluation|
      sum_of_overall_score += evaluation.useful_course_overall_score
    end
    sum_of_overall_score / num_of_evaluations
  end

  def  calculate_average_hours_committed
    evaluations = max_five_evaluations
    return 'N/A' if evaluations.empty?
    num_of_evaluations = evaluations.length
    sum_of_overall_score = 0
    evaluations.each do |evaluation|
      sum_of_overall_score += evaluation.hours_committed
    end
    sum_of_overall_score / num_of_evaluations
  end
end

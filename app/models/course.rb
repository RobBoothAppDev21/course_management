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
class Course < ApplicationRecord
  # before_save :set_searchable
  has_many :sections # , -> { where academic_year: '2021-2022' }

  # has_many :current_sections, -> { current_academic_year }, class_name: 'Section'

  # A course has many evaluations through sections
  # A course has many bid_histories through sections

  def self.current_sections(academic_period = '2021-2022')
    joins(:sections).where(sections: { academic_year: academic_period })
  end

  # Parameters: {"q"=>{"searchable_or_sections_searchable_cont"=>"", 
  # "sections_academic_year_cont"=>"", "sections_program_cont"=>"",
  # "sections_quarter_cont"=>"", "sections_sunday_eq"=>"", "sections_monday_cont"=>"", 
  # "sections_start_time_cont"=>"", "sections_credits_cont"=>"", "sections_tuesday_cont"=>""}, "commit"=>"Search"}
  def self.clean_params(parameters_hash)
    search_params = parameters_hash[:q]
    search_params[0] unless search_params.nil?
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

  def calculate_ratio_overall_hours
    return 0 if calculate_average_hours_committed == 0 || calculate_average_overall_score == 0
    return 0 if calculate_average_hours_committed.nil? || calculate_average_overall_score.nil?
    return 0 if calculate_average_hours_committed == 'N/A' || calculate_average_overall_score == 'N/A'
    ratio = calculate_average_overall_score / calculate_average_hours_committed
  end

  def set_searchable
    self.searchable = [title, number, credits].join(' ') # , calculate_average_hours_committed,
                      #  calculate_average_overall_score].join(' ')
  end
  
  ransacker :academic_year do
    Arel.sql("array_to_string(sections.academic_year, ',')")
  end

  ransacker :quarter do
    Arel.sql("array_to_string(sections.quarter, ',')")
  end

  ransacker :program do
    Arel.sql("array_to_string(sections.program, ',')")
  end

  ransacker :searchable_course_areas_list do
    Arel.sql("array_to_string(searchable_course_areas_list, ',')")
  end

  ransacker :searchable_meet_days_list do
    Arel.sql("array_to_string(sections.searchable_meet_days_list, ',')")
  end

  ransacker :searchable_time_of_day_list do
    Arel.sql("array_to_string(sections.searchable_time_of_day_list, ',')")
  end

  # ransacker :credits do
  #   Arel.sql("array_to_string(courses.credits, ',')")
  # end
  
  ransacker :searchable_concentrations_list do
    Arel.sql("array_to_string(searchable_concentrations_list, ',')")
  end
end

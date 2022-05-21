require 'csv'

class EvaluationParser
  attr_accessor :evaluation

  def initialize(row)
    @evaluation = row
  end

  def clean_course_number_section
    evaluation['course_number_section'].split('-')
  end

  def extract_course_number
    course_details = clean_course_number_section
    course_details[0]
  end

  def extract_course_section
    course_details = course_number = clean_course_number_section
    course_details[1]
  end

  def extract_title
    evaluation['course_title']
  end

  def extract_first_name
    evaluation['first_name']
  end

  def extract_last_name
    evaluation['last_name']
  end

  def clean_quarter_year
    evaluation["term"].split(' ')
  end

  def extract_quarter
    quarter = clean_quarter_year
    quarter[0]
  end

  def extract_year
    year = clean_quarter_year
    year[1]
  end

  def extract_invited_count
    evaluation['invited_count']
  end

  def extract_response_count
    evaluation['response_count']
  end

  def extract_percent_responded
    (extract_response_count.to_f / extract_invited_count.to_f ) * 100
  end

  def extract_hours_committed
    evaluation['hours_committed']
  end

  def extract_material_conveyed_clear_score
    evaluation['material_conveyed_clear_score']
  end

  def extract_material_conveyed_interesting_score
    evaluation['material_conveyed_interesting_score']
  end

  def extract_useful_tool_concepts_insights_score
    evaluation['useful_tool_concepts_insights_score']
  end

  def extract_useful_course_score
    evaluation['useful_course_score']
  end

  def extract_recommendation_score
    evaluation['recommendation_score']
  end

end
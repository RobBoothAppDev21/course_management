namespace :slurp do
  desc "TODO"
  task evaluations: :environment do

    evaluation_headers = %w[course_number_section
                            course_title
                            first_name
                            last_name term
                            invited_count
                            response_count
                            percent_respond
                            hours_committed
                            material_conveyed_clear_score
                            material_conveyed_interesting_score
                            useful_tool_concepts_insights_score
                            useful_course_score
                            recommendation_score]

    evaluation_text = File.read(Rails.root.join('lib', 'csvs', '20220412_course_evaluations.csv'))
    evaluations_csv = CSV.parse(evaluation_text, headers: evaluation_headers, encoding: 'UTF-8')
    evaluations_csv.delete(0)

    evaluations_csv.each do |row|
      x = EvaluationParser.new(row)
      evaluation = Evaluation.new
      evaluation.title = x.extract_title
      evaluation.course_number = x.extract_course_number
      evaluation.course_section = x.extract_course_section
      evaluation.quarter = x.extract_quarter
      evaluation.year = x.extract_year
      evaluation.instr_first_name = x.extract_first_name
      evaluation.instr_last_name = x.extract_last_name
      evaluation.invited = x.extract_invited_count
      evaluation.responded = x.extract_response_count
      evaluation.percent_responded = x.extract_percent_responded.round(2)
      evaluation.hours_committed = x.extract_hours_committed
      evaluation.material_conveyed_clear_score = x.extract_material_conveyed_clear_score
      evaluation.material_conveyed_interesting_score = x.extract_material_conveyed_interesting_score
      evaluation.useful_tools_concepts_insights_score = x.extract_useful_tool_concepts_insights_score
      evaluation.useful_course_overall_score = x.extract_useful_course_score
      evaluation.recommendation_score = x.extract_recommendation_score
      evaluation.save
    end
    p "#{Evaluation.count} evaluations have been added to the Evaluation table."
  end
end

namespace :create_instructors_sections do
  desc "TODO"
  task relationships: :environment do

    all_evaluations = Evaluation.all

    all_evaluations.each do |evaluation|
      section_instructor = InstructorSection.where(section_id: evaluation.section_id,
                                                   instructor_id: evaluation.instructor_id)

      next unless section_instructor.empty?
      x = InstructorSection.new
      x.section_id    = evaluation.section_id
      x.instructor_id = evaluation.instructor_id
      x.save
    end
  end

end

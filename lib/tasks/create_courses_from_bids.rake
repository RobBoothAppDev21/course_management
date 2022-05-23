require 'course_cleaner'

namespace :create_additional_courses do

  namespace :bid_history do
    desc 'Adding older courses to Courses table from bid history'
    task create_courses: :environment do
      include CourseCleaner
      bid_histories = BidHistory.all
      bid_histories.each do |bh|
        result = Course.find_by(number: bh.course_number,
                                section: bh.course_section,
                                quarter: bh.course_quarter,
                                year: bh.course_year)
        if result
          bh.update(course_id: result.id)
        else
          course = Course.new
          course.title = bh.course_title
          course.number = bh.course_number
          course.section = bh.course_section
          course.year = bh.course_year
          course.quarter = bh.course_quarter
          course.credits = 0
          course.academic_year = CourseCleaner.extract_academic_year(bh)
          course.save

          bh.update(course_id: course.id)
        end
      end
    end
  end

  namespace :evals do
    desc 'Adding courses to Courses table from evaluations'
    task create_courses: :environment do
      evals = Evaluation.all
      evals.each do |eval|
      end
    end
  end
end
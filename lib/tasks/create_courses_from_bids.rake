require 'course_cleaner'

namespace :create_additional_courses do

  namespace :bid_history do
    desc 'Adding older courses to Courses table from bid history'
    task create_courses: :environment do
      include CourseCleaner
      bid_histories = BidHistory.all
      bid_histories.each do |bh|
        result = Section.find_by(number: bh.course_number,
                                section: bh.course_section,
                                quarter: bh.course_quarter,
                                year: bh.course_year)
        if result
          bh.update(course_id: result.id)
        else
          course = Section.new
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
      include CourseCleaner
      evals = Evaluation.all
      evals.each do |ev|
        result = Section.find_by(number: ev.course_number,
                                section: ev.course_section,
                                quarter: ev.course_quarter,
                                year: ev.course_year)
        if result
          ev.update(course_id: result.id)
        else
          x = Section.new
          x.title = ev.course_title
          x.number = ev.course_number
          x.section = ev.course_section
          x.year = ev.course_year
          x.quarter = ev.course_quarter
          x.credits = 0
          x.academic_year = SectionCleaner.extract_academic_year(ev)
          x.save

          ev.update(course_id: x.id)
        end
      end
    end
  end
end
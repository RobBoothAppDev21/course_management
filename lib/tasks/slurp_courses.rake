require 'csv'
# require 'pry-byebug'

namespace :slurp do
  desc 'TODO'
  task courses: :environment do

    course_headers = %w[Quarter Section Title Program Instructor1 Instructor2 Instructor3
                        Instructor4 MeetDayTime Building Location Prerequisites Syllabus Note]

    course_text = File.read(Rails.root.join('lib', 'csvs', '20220411_booth_courses.csv'))
    courses_csv = CSV.parse(course_text, headers: course_headers, encoding: 'UTF-8')
    courses_csv.delete(0)

    courses_csv.each do |row|
      x = CourseParser.new(row)
      course = Course.new
      course.title = x.extract_title
      course.number = x.extract_number
      course.section = x.extract_section
      course.year = x.extract_year
      course.quarter = x.extract_quarter
      course.sunday = x.extract_sunday
      course.monday = x.extract_monday
      course.tuesday = x.extract_tuesday
      course.wednesday = x.extract_wednesday
      course.thursday = x.extract_thursday
      course.friday = x.extract_friday
      course.saturday = x.extract_saturday
      course.start_time = x.extract_start_time
      course.end_time = x.extract_end_time
      course.room = x.extract_room
      course.building = x.extract_building
      course.credits = x.extract_credits
      course.program = x.extract_program
      # course.syllabus = x.extract_syllabus
      course.save

      p "SAVED: #{course.title} #{course.number}-#{course.section}"
      x.instructors_arr.each do |name|
        last_name, first_name = name.sub(',', '').split

        if name == 'Staff'
          last_name = 'Staff'
          first_name = 'Staff'
        end

        if name == 'Ajayi Jones, Luvvie'
          full_name = name.split(',')
          last_name = full_name[0]
          first_name = full_name[1].strip
        end

        if name == 'Hanna, J.'
          full_name = 'Hanna, J. Douglas'.split(',')
          last_name = full_name[0]
          first_name = full_name[1].strip
        end
        instr = Instructor.find_by(first_name: first_name, last_name: last_name)
        ci = CourseInstructor.new course_id: course.id, instructor_id: instr.id
        if ci.valid?
          ci.save
          p 'Course and Instructor relationship saved'
        else
          p 'Did not save'
        end
      end
    end

    puts "There are now #{Course.count} rows saved in courses table"
    puts "There are now #{CourseInstructor.count} rows saved in CourseInstructor table"
  end
end

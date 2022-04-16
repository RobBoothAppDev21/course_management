namespace :slurp do
  desc 'TODO'
  task courses: :environment do

    require 'csv'

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
    end

    puts "There are now #{Course.count} rows saved in courses table"
  end

  desc 'TODO'
  task instructors: :environment do

    instructor_text = File.read(Rails.root.join('lib', 'csvs', '20220415_booth_faculty.csv'))
    instructor_csv = CSV.parse(instructor_text, encoding: 'UTF-8')
    instructor_csv.shift

    professors = Hash.new { |h, k| h[k] = {} }
    csv.each_with_index do |row, index|
      remainder = index % 4
      if remainder.zero?
        instr_name = row[0].strip
        professors[instr_name][:title] = row[2]
      else
        instr_hash = professors[csv[index - remainder][0].strip]
        case remainder
        when 1
          instr_hash[:department] = row[2]
        when 2
          instr_hash[:phone_number] = row[2]
        when 3
          instr_hash[:email] = row[2]
        end
      end
    end

    professors.each do |prof_details|
      y = InstructorParser.new(prof_details)
      professor = Professor.new
      professor.first = y.extract_first_name
      professor.last = y.extract_last_name
      professor.title = y.extract_title_name
      professor.department = y.extract_department_name
      professor.phone_number = y.extract_phone_number_name
      professor.email = y.extract_email_name
      # professor.save

      p "SAVED: Professor #{first.capitalize} #{last.capitalize}"
    end

    p "There are #{Professor.count} rows saved to the professor database"
  end
end

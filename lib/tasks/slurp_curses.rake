require 'csv'
# require 'pry-byebug'

namespace :slurp do
  desc 'TODO'
  task courses: :environment do

    # require 'csv'

    course_headers = %w[Quarter Section Title Program Instructor1 Instructor2 Instructor3
                        Instructor4 MeetDayTime Building Location Prerequisites Syllabus Note]

    course_text = File.read(Rails.root.join('lib', 'csvs', '20220411_booth_courses.csv'))
    courses_csv = CSV.parse(course_text, headers: course_headers, encoding: 'UTF-8')
    courses_csv.delete(0)

    holder = []
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
      # course.save

      # p "SAVED: #{course.title} #{course.number}-#{course.section}"
      x.instructors_arr.each do |name|
        last_name, first_name = name.sub(',', '').split
        instr = Instructor.find_by(first_name: first_name, last_name: last_name)
        if instr.nil?
          holder << "#{first_name} #{last_name}"
          # p "#{first_name} #{last_name}: #{course.number}-#{course.section}"
          # p instr
        end
        # ci = CourseInstructor.new course_id: course.id, instructor_id: instr.id
        # if ci.valid?
        #   ci.save
        #   p 'Course and Instructor relationship saved'
        # else
        #   p 'Did not save'
        # end
      end
    end
    p holder.uniq

    # puts "There are now #{Course.count} rows saved in courses table"
    # puts "There are now #{CourseInstructor.count} rows saved in CourseInstructor table"
  end

  desc 'TODO'
  task instructors: :environment do

    instructor_text = File.read(Rails.root.join('lib', 'csvs', '20220416_booth_faculty.csv'))
    instructor_csv = CSV.parse(instructor_text, encoding: 'UTF-8')
    instructor_csv.shift

    instructors = Hash.new { |h, k| h[k] = {} }
    instructor_csv.each_with_index do |instr_details, index|
      remainder = index % 4
      if remainder.zero?
        instr_name = instr_details[0].strip
        instructors[instr_name][:title] = instr_details[2]
      else
        instr_key = instructors[instructor_csv[index - remainder][0].strip]
        case remainder
        when 1
          # instr_key[:department] = instr_details[2]
          if instr_details[1][1] == 'Department'
            instr_key[:department] = instr_details[2]
          else
            instr_key[:academic_area] = instr_details[2]
          end
        when 2
          instr_key[:phone_number] = instr_details[2]
        when 3
          instr_key[:email] = instr_details[2]
        end
      end
    end

    instructors.each_pair do |prof_name, prof_details|
      y = InstructorParser.new(prof_name, prof_details)
      instructor = Instructor.new
      instructor.first_name = y.extract_first_name
      instructor.last_name = y.extract_last_name
      instructor.title = y.extract_title
      instructor.department = y.extract_department
      instructor.phone_number = y.extract_phone_number
      instructor.email = y.extract_email
      instructor.academic_area = y.extract_academic_area
      # instructor.save
      binding.pry
      # p "SAVED: Instructor #{instructor.first_name.capitalize} #{instructor.last_name.capitalize}"
    end

    p "There are #{Instructor.count} rows saved to the instructor database"
  end
end

require 'csv'

namespace :slurp do
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
      instructor.save
      # p "SAVED: Instructor #{instructor.first_name.capitalize} #{instructor.last_name.capitalize}"
    end
    # binding.pry
  end
end
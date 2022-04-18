require 'csv'
# require 'pry-byebug'

class InstructorParser
  attr_reader :name, :details

  def initialize(name, details)
    @name = name
    @details = details
  end

  def clean_name
    @name.sub(',', '').split
    # @instructor.first.first.sub(',', '').split
  end

  def extract_first_name
    clean_name[1]
  end

  def extract_last_name
    clean_name[0]
  end

  def extract_title
    @details[:title]
  end

  def extract_department
    @details[:department]
  end

  def extract_phone_number
    @details[:phone_number]
  end

  def extract_email
    @details[:email].downcase
  end

  def extract_academic_area
    @details[:academic_area]
  end
end


# test_course.instructors_arr.each do |name|
#   last_name, first_name = name.sub(",", "").split
#   instr = Instructor.find_by(first_name: first_name, last_name: last_name)
#   instr.id
# end
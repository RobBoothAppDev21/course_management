require 'csv'
# require 'pry-byebug'

class InstructorParser
  attr_reader :details, :name

  def initialize(hash)
    @details = hash
    @name = hash.first[0]
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
    @details[name][:title]
  end

  def extract_department
    @details[name][:department]
  end

  def extract_phone_number
    @details[name][:phone_number]
  end

  def extract_email
    @details[name][:email]
  end
end

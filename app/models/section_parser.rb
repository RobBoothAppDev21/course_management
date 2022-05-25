require 'csv'
# require 'Date'
# require 'pry-byebug' # binding.pry

class SectionParser
  attr_accessor :course

  def initialize(row)
    @course = row
  end

  def extract_title
    course['Title']
  end

  def extract_number
    number = course['Section'].split('-')
    number[0]
  end

  def extract_section
    course_section = course['Section'].split('-')
    course_section[1]
  end

  def clean_quarter_year
    course["Quarter"].split(' ')
  end

  def extract_quarter
    quarter = clean_quarter_year
    quarter[0]
  end

  def extract_year
    year = clean_quarter_year
    year[1]
  end

  def clean_day_time
    course['MeetDayTime']
  end

  def extract_start_time
    clean_day_time.split(' ')[1].split('-')[0]
  end

  def extract_end_time
    clean_day_time.split(' ')[1].split('-')[1]
  end

  def days_of_week
    days_hash = {}
    %w[SU M T W TH F S].each_with_index do |day, index|
      days_hash[day] = Date::DAYNAMES[index]
    end
    days_hash
  end

  def clean_day
    days_hash = days_of_week
    holder = []
    days = clean_day_time.split(' ')[0]
    return holder if [' ', nil].include?(days)

    return holder << days_hash[days] if days.length == 1 || %w[SU TH].include?(days)

    case days
    when 'MW'
      %w[M W].each { |day| holder << days_hash[day] }
    when 'TTH'
      %w[T TH].each { |day| holder << days_hash[day] }
    end

    holder
  end

  def extract_sunday
    clean_day.include?('Sunday')
  end

  def extract_monday
    clean_day.include?('Monday')
  end

  def extract_tuesday
    clean_day.include?('Tuesday')
  end

  def extract_wednesday
    clean_day.include?('Wednesday')
  end

  def extract_thursday
    clean_day.include?('Thursday')
  end

  def extract_friday
    clean_day.include?('Friday')
  end

  def extract_saturday
    clean_day.include?('Saturday')
  end

  def extract_building
    course['Building']
  end

  def extract_room
    course['Location']
  end

  def extract_credits
    credits = course['Note'].match(/\b5\d{1}\s[a-zA-z]{4,5}\b/) if course['Note']
    return 100 if credits.nil?

    50 if ['50 unit', '50 units'].include? credits[0].downcase
  end

  def extract_program
    course['Program']
  end

  def instructors_arr
    all_instructors = []
    4.times do |i|
      break if course["Instructor#{i + 1}"].nil?

      all_instructors << course["Instructor#{i + 1}"].strip
      # all_instructors << course["Instructor#{i + 1}"].strip unless course["Instructor#{i + 1}"].nil?
    end
    all_instructors
  end

  # def clean_instructor_name(name)
  #   return %w(Staff Staff) if name == 'Staff'
  #   return name.split(',') if name == 'Ajayi Jones, Luvvie'
  #   return 'Hanna, J. Douglas'.split(',') if name == 'Hanna J.'
  # end
end

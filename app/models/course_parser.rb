require 'csv'
# require 'Date'
# require 'pry-byebug' # binding.pry

class CourseParser
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

  # def clean_instructor(*instructors)
  #   all_instructors = []
  #   instructors.each do |instructor|
  #     all_instructors << instructor if instructor
  #   end
  #   @instructors = all_instructors
  # end

  # def clean_meeting_date_time(meeting_date_time)
  #   if [' ', nil].include?(meeting_date_time) # meeting_date_time == " " || meeting_date_time == nil
  #     @day = 'blank'
  #     @start_time = 'blank'
  #     @end_time = 'blank'
  #   else
  #     day_time = meeting_date_time.split(' ')
  #     clean_meet_days(day_time)
  #     clean_meet_time(day_time)
  #   end
  # end

  # def clean_meet_days(day_time)
  #   days_string = day_time[0]
  #   @days = case days_string
  #           when 'MW'
  #             %w[M W]
  #           when 'TTH'
  #             %w[T TH]
  #           else
  #             'TBD'
  #           end
  # end

  # def clean_meet_time(time)
  #   split_time = time[1].split('-')
  #   start_time = split_time[0]
  #   end_time = split_time[1]
  #   @start_time = DateTime.strptime(start_time, '%H:%M%p')
  #   @end_time = DateTime.strptime(end_time, '%H:%M%p')
  # end
end

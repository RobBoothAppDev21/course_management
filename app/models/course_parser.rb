require 'csv'
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
    # quarter_year = course["Quarter"].split(' ')
    # quarter_year[0]
    quarter = clean_quarter_year
    quarter[0]
  end

  def extract_year
    year = clean_quarter_year
    year[1]
    # quarter_year = course["Quarter"].split(' ')
    # quarter_year[1]
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

  def extract_day
    days = clean_day_time.split(' ')[0]
    if [' ', nil].include(days)
      false
    else

    end
  end

  def extract_building
    course['Building']
  end

  def extract_room
    course['Location']
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

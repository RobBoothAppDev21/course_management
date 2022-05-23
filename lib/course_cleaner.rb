module CourseCleaner

  def extract_academic_year(bid_eval_object)
    if bid_eval_object.course_quarter == 'Autumn'
      start_year = bid_eval_object.course_year.to_i
      end_year = bid_eval_object.course_year.to_i + 1
    else
      start_year = bid_eval_object.course_year.to_i - 1
      end_year = bid_eval_object.course_year.to_i
    end
    "#{start_year}-#{end_year}"
  end

  # def clean_time(bid_object)
  #   bid_object.day_time.match(/\d\W\d{2}.{1,}/)
  # end

  # def extract_start_time
  #   start_time = clean_time[0].split('-')[0].strip
  #   start_time[0].to_i < 7 ? "#{start_time}PM" : "#{start_time}AM"
  # end

  # def extract_end_time
  #   end_time = clean_time[0].split('-')[1].strip
  # end

  # def days_of_week
  #   days_hash = {}
  #   %w[SU M T W TH F S].each_with_index do |day, index|
  #     days_hash[day] = Date::DAYNAMES[index]
  #   end
  #   days_hash
  # end

  # def clean_day
  #   days_hash = days_of_week
  #   holder = []
  #   days = clean_day_time.split(' ')[0]
  #   return holder if [' ', nil].include?(days)

  #   return holder << days_hash[days] if days.length == 1 || %w[SU TH].include?(days)

  #   case days
  #   when 'MW'
  #     %w[M W].each { |day| holder << days_hash[day] }
  #   when 'TTH'
  #     %w[T TH].each { |day| holder << days_hash[day] }
  #   end

  #   holder
  # end

  # def extract_sunday
  #   clean_day.include?('Sunday')
  # end

  # def extract_monday
  #   clean_day.include?('Monday')
  # end

  # def extract_tuesday
  #   clean_day.include?('Tuesday')
  # end

  # def extract_wednesday
  #   clean_day.include?('Wednesday')
  # end

  # def extract_thursday
  #   clean_day.include?('Thursday')
  # end

  # def extract_friday
  #   clean_day.include?('Friday')
  # end

  # def extract_saturday
  #   clean_day.include?('Saturday')
  # end
end
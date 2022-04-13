namespace :slurp do
  desc "TODO"
  task courses: :environment do
    
    require 'csv'

    csv_headers = %w[Quarter Section Title Program Instructor nil nil nil
                     MeetDayTime Building Location Prerequisites Syllabus Note]

    csv_text = File.read(Rails.root.join('lib', 'csvs', '20220411_booth_courses.csv'))
    csv = CSV.parse(csv_text, headers: csv_headers, encoding: 'ISO-8859-1')
    # csv.each do |row|
    #   x = CourseParser.new(row)
    #   p x['MeetDayTime']
    #   # puts row.to_hash['MeetDayTime'].class
    # end
    # row_count = 0
    csv.each do |row|
      # puts row.to_hash
      x = CourseParser.new(row)
      course = Course.new
      # p x.course['Section']
      course.title = x.extract_title
      course.number = x.extract_number
      course.section = x.extract_section
      course.year = x.extract_year
      course.quarter = x.extract_quarter
      # course.sunday = x.extract_sunday
      # course.monday = x.extract_monday
      # course.tuesday = x.extract_tuesday
      # course.wednesday = x.extract_wednesday
      # course.thursday = x.extract_thursday
      # course.friday = x.extract_friday
      # course.saturday = x.extract_saturday
      course.start_time = x.extract_start_time
      course.end_time = x.extract_end_time
      course.room = x.extract_room
      course.building = x.extract_building
      # course.credit = x.extract_credit
      # course.syllabus = x.extract_syllabus

      p course
    end
  
  end
end

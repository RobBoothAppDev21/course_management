namespace :slurp do
  desc "TODO"
  task bid_histories: :environment do

    bid_history_headers = %w[course_number_section
                             course_title
                             course_quarter
                             course_year
                             course_day_time
                             course_instructor
                             phase1_enrollment
                             phase1_seats_available
                             phase1_price
                             phase2_enrollment
                             phase2_seats_available
                             phase2_price
                             phase1_new_students_enrollment
                             phase1_new_students_seats_available
                             phase1_new_students_price
                             phase2_new_students_enrollment
                             phase2_new_students_seats_available
                             phase2_new_students_price
                             phase3_enrollment
                             phase3_seats_available
                             phase3_price
                             phase4_enrollment
                             phase4_seats_available
                             phase4_price]

    bid_history_text = File.read(Rails.root.join('lib',
                                                 'csvs',
                                                 '20220521_course_price_history_SPR2022_AUT2017.csv'))
    bid_history_csv = CSV.parse(bid_history_text, headers: bid_history_headers, encoding: 'UTF-8')
    bid_history_csv.delete(0)

    bid_history_csv.each do |row|
      x = BidHistoryParser.new(row)
      bid_history = BidHistory.new
      bid_history.course_number = x.extract_course_number
      bid_history.course_section = x.extract_course_section
      bid_history.course_title = x.extract_course_title
      bid_history.course_quarter = x.extract_course_quarter
      bid_history.course_year = x.extract_course_year
      bid_history.day_time = x.extract_course_day_time
      bid_history.instructor = x.extract_course_instructor
      bid_history.phase1_enrollment = x.extract_phase1_enrollment
      bid_history.phase1_seats_available = x.extract_phase1_seats_available
      bid_history.phase1_price = x.extract_phase1_price
      bid_history.phase2_enrollment = x.extract_phase2_enrollment
      bid_history.phase2_seats_available = x.extract_phase2_seats_available
      bid_history.phase2_price = x.extract_phase2_price
      bid_history.phase1_new_students_enrollment = x.extract_phase1_new_students_enrollment
      bid_history.phase1_new_students_seats_available = x.extract_phase1_new_students_seats_available
      bid_history.phase1_new_students_price = x.extract_phase1_new_students_price
      bid_history.phase2_new_students_enrollment = x.extract_phase2_new_students_enrollment
      bid_history.phase2_new_students_seats_available = x.extract_phase2_new_students_seats_available
      bid_history.phase2_new_students_price = x.extract_phase2_new_students_price
      bid_history.phase3_enrollment = x.extract_phase3_enrollment
      bid_history.phase3_seats_available = x.extract_phase3_seats_available
      bid_history.phase3_price = x.extract_phase3_price
      bid_history.save
    end

    p "#{BidHistory.count} bid histories have added to the BidHisory table"
  end

end

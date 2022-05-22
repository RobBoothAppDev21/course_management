require 'csv'

class BidHistoryParser
  attr_reader :bid_history

  def initialize(row)
    @bid_history = row
  end

  def clean_course_number_section
    bid_history['course_number_section'].split('-')
  end

  def extract_course_number
    course_number = clean_course_number_section
    course_number[0]
  end

  def extract_course_section
    course_section = clean_course_number_section
    course_section[1]
  end

  def extract_course_title
    bid_history['course_title']
  end

  def extract_course_quarter
    bid_history['course_quarter']
  end

  def extract_course_year
    bid_history['course_year']
  end

  def extract_course_day_time
    bid_history['course_day_time']
  end

  def extract_course_instructor
    bid_history['course_instructor']
  end

  def extract_phase1_enrollment
    bid_history['phase1_enrollment']
  end

  def extract_phase1_seats_available
    seats = bid_history['phase1_seats_available']
    seats == 'CLO' ? 0 : seats
  end

  def extract_phase1_price
    price = bid_history['phase1_price']
    price == 'N/A' ? 0 : price
  end

  def extract_phase2_enrollment
    bid_history['phase2_enrollment']
  end

  def extract_phase2_seats_available
    seats = bid_history['phase2_seats_available']
    seats == 'CLO' ? 0 : seats
  end

  def extract_phase2_price
    price = bid_history['phase2_price']
    price == 'N/A' ? 0 : price
  end

  def extract_phase1_new_students_enrollment
    bid_history['phase1_new_students_enrollment']
  end

  def extract_phase1_new_students_seats_available
    seats = bid_history['phase1_new_students_seats_available']
    seats == 'CLO' ? 0 : seats
  end

  def extract_phase1_new_students_price
    price = bid_history['phase1_new_students_price']
    price == 'N/A' ? 0 : price
  end

  def extract_phase2_new_students_enrollment
    bid_history['phase2_new_students_enrollment']
  end

  def extract_phase2_new_students_seats_available
    seats = bid_history['phase2_new_students_seats_available']
    seats == 'CLO' ? 0 : seats
  end

  def extract_phase2_new_students_price
    price = bid_history['phase2_new_students_price']
    price == 'N/A' ? 0 : price
  end

  def extract_phase3_enrollment
    bid_history['phase3_enrollment']
  end

  def extract_phase3_seats_available
    seats = bid_history['phase3_seats_available']
    seats == 'CLO' ? 0 : seats
  end

  def extract_phase3_price
    price = bid_history['phase3_price']
    price == 'N/A' ? 0 : price
  end

  def extract_phase4_enrollment
    bid_history['phase4_enrollment']
  end

  def extract_phase4_seats_available
    seats = bid_history['phase4_seats_available']
    seats == 'CLO' ? 0 : seats
  end

  def extract_phase4_price
    price = bid_history['phase4_price']
    price == 'N/A' ? 0 : price
  end

end
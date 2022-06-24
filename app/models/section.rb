# == Schema Information
#
# Table name: sections
#
#  id                          :bigint           not null, primary key
#  title                       :string
#  number                      :string
#  section                     :string
#  year                        :string
#  quarter                     :string
#  sunday                      :boolean          default(FALSE)
#  monday                      :boolean          default(FALSE)
#  tuesday                     :boolean          default(FALSE)
#  wednesday                   :boolean          default(FALSE)
#  thursday                    :boolean          default(FALSE)
#  friday                      :boolean          default(FALSE)
#  saturday                    :boolean          default(FALSE)
#  start_time                  :string
#  end_time                    :string
#  building                    :string           default("TBA")
#  room                        :string           default("TBA")
#  credits                     :integer          default(100)
#  syllabus                    :string
#  program                     :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  academic_year               :string
#  course_id                   :bigint
#  searchable                  :text
#  searchable_meet_days_list   :string
#  searchable_time_of_day_list :string
#
class Section < ApplicationRecord
  # before_save :set_searchable

  QUARTER_SORT = %w(Summer Spring Winter Autumn)
  ACADEMIC_YEAR_SORT = %w(2021-2022 2020-2021 2019-2020 2018-2019 2017-2018 2016-2017)

  has_many :instructor_sections
  has_many :instructors, through: :instructor_sections
  has_one :bid_history
  has_many :evaluations
  belongs_to :course, counter_cache: true

  validates :number, :year, :section, :quarter, presence: true

  scope :sort_academic_year, -> { in_order_of(:academic_year, ACADEMIC_YEAR_SORT) }
  scope :sort_quarter, -> { in_order_of(:quarter, QUARTER_SORT) }
  scope :sorted_sections, -> { sort_academic_year.sort_quarter.order(section: :asc)}
  scope :current_academic_year, -> { where academic_year: '2021-2022' }

  # scope :search_instructor, -> () { }

  def list_instructors
    name_holder = []
    instructor_array = instructors
    instructor_array.each do |instructor|
      name_holder << "#{instructor.first_name} #{instructor.last_name}"
    end
    name_holder.join(', ')
  end

  def course_section
    "#{course.number}-#{section}"
  end

  def meeting_days
    weekdays = %i[sunday monday tuesday wednesday thursday friday saturday]
    days_taught = []
    weekdays.each do |day|
      if self.send(day)
        days_taught << day.to_s.capitalize
      end
    end
    days_taught
  end

  def time_of_day_start # Morning, Afternoon, Evening
    unless start_time.nil?
      if start_time.include? 'AM'
        return 'Morning'
      elsif start_time.include? 'PM'
        start = start_time.match(/(\d{2})/)[0].to_i
        case start
        when ((5..8).include? start)
          'Evening'
        else
          'Afternoon'
        end
      end
    end
  end

  def abbrev_meeting_days
    meet_days = meeting_days
    if !meeting_days.empty?
      abbrev_days = []
      meet_days.each do |day|
        abbrev_day = case day
        when 'Tuesday' || 'Thursday'
          abbrev_days << day[0..3] + '.'
        else
          abbrev_days << day[0..2] + '.'
        end
      end
    end
    abbrev_days.empty? ? 'TBD' : abbrev_days.join(', ')
  end

  def set_searchable
    self.searchable = [course.title, course_section, year, quarter, program, academic_year, 
                       meeting_days, start_time, end_time, time_of_day_start, building, 
                       list_instructors].flatten.join(' ').squeeze(' ')
  end
end

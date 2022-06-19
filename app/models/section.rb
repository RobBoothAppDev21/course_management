# == Schema Information
#
# Table name: sections
#
#  id            :bigint           not null, primary key
#  title         :string
#  number        :string
#  section       :string
#  year          :string
#  quarter       :string
#  sunday        :boolean          default(FALSE)
#  monday        :boolean          default(FALSE)
#  tuesday       :boolean          default(FALSE)
#  wednesday     :boolean          default(FALSE)
#  thursday      :boolean          default(FALSE)
#  friday        :boolean          default(FALSE)
#  saturday      :boolean          default(FALSE)
#  start_time    :string
#  end_time      :string
#  building      :string           default("TBA")
#  room          :string           default("TBA")
#  credits       :integer          default(100)
#  syllabus      :string
#  program       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  academic_year :string
#  course_id     :bigint
#
class Section < ApplicationRecord
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

  def meeting_days
    weekdays = %i[sunday monday tuesday wednesday thursday friday saturday]
    days_taught = []
    weekdays.each do |day|
      if self.send(day)
        day_as_string = day.to_s.capitalize
        abbrev_day = case day_as_string
        when 'Tuesday' || 'Thursday'
          day_as_string[0..3] + '.'
        else
          day_as_string[0..2] + '.'
        end
        days_taught << abbrev_day
      end
    end 
    days_taught.empty? ? 'TBD' : days_taught.join(', ')
  end
end

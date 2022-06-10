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
  has_many :instructor_sections
  has_many :instructors, through: :instructor_sections
  has_one :bid_history
  has_many :evaluations
  belongs_to :course, counter_cache: true

  validates :number, :year, :section, :quarter, presence: true

  scope :current, -> { where academic_year: '2021-2022' }

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
        days_taught << day.to_s.capitalize
      end
    end
    days_taught.empty? ? 'N/A' : days_taught.join(', ')
  end
end

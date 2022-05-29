class CoursesController < ApplicationController
  before_action :set_course, only: %i[show]
  def index
    @courses = Course.all.order(:title)
    # @courses = Course.joins(:sections) #.where("academic_year is 2021-2022")
    # @courses = Course.all.sections.where(academic_year: '2021-2022')
  end

  def show
  end

  private
  def set_course
    course_id = params[:id]
    @course = Course.find(course_id)
  end
end

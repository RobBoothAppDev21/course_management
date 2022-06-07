class CoursesController < ApplicationController
  before_action :set_course, only: %i[show]
  def index
    # @courses = Course.all.order(:title)
    @courses = Course.joins(:sections).where(sections: { academic_year: '2021-2022' }).distinct
  end

  def show
  end

  private

  def set_course
    course_id = params[:id]
    @course = Course.find(course_id)
  end
end

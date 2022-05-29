class SectionsController < ApplicationController
  before_action :set_course, only: %i[index show]
  before_action :set_section, only: :show
  def index
    @sections = Section.where(academic_year: '2021-2022', course_id: @course.id)
  end

  def show
  end

  private
  def set_course
    course_id = params[:course_id]

    @course = Course.find(course_id)
  end

  def set_section
    section_id = params[:section_id]
    @section = Section.find(section_id)
  end

  def course_params
    # params.requre(:section).permit(:title)
  end
end
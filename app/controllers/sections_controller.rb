class SectionsController < ApplicationController
  before_action :set_course, only: %i[index show]
  before_action :set_section, only: :show

  def index
    @all_sections = Section.where(course_id: @course.id).sorted_sections

    @sections = @all_sections.current_academic_year
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
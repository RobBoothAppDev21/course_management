class SectionsController < ApplicationController
  before_action :set_course, only: :show
  def index
    @sections = Section.where(academic_year: '2021-2022')
  end

  def show
  end

  private
  def set_course
    section_id = params[:id]

    @section = Section.find(section_id)
  end

  def course_params
    # params.requre(:section).permit(:title)
  end
end
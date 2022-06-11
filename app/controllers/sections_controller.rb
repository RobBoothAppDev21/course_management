class SectionsController < ApplicationController
  before_action :set_course, only: %i[index show]
  before_action :set_section, only: :show

  QUARTER_SORT = %w(Summer Spring Winter Autumn)
  ACADEMIC_YEAR_SORT = %w(2021-2022 2020-2021 2019-2020 2018-2019 2017-2018 2016-2017)

  def index
    @all_sections = Section.where(course_id: @course.id)
                           .in_order_of(:academic_year, ACADEMIC_YEAR_SORT)
                           .in_order_of(:quarter, QUARTER_SORT)

    @sections = @all_sections.where(academic_year: '2021-2022', course_id: @course.id)
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
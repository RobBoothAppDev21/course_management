class CoursesController < ApplicationController
  def index
    @courses = Course.all.order(:title)
    # @courses = Course.joins(:sections) #.where("academic_year is 2021-2022")
    # @courses = Course.all.sections.where(academic_year: '2021-2022')
  end
end

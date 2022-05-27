class CoursesController < ApplicationController
  def index
    @courses = Course.all
    # @courses = Course.all.sections.where(academic_year: '2021-2022')
  end
end

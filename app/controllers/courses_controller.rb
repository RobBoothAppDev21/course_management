class CoursesController < ApplicationController
  def index
    @courses = Course.where(academic_year: '2021-2022')
  end

  def show
  end

  private
  def set_course
    course_id = params[:id]

    @movie = Movie.find(course_id)
  end

  def course_params
    params.requre(:course).permit(:title)
  end
end
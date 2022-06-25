class CoursesController < ApplicationController
  before_action :set_course, only: %i[show]
  # protect_from_forgery with: :null_session, only: %i[search index]
  
  def search
    index
    render :index
  end
  
  def index
    @courses_query = params[:q]
    @q = Course.ransack(params[:q])
    @courses = @q.result(distinct: true).includes(:sections).current_sections
  end

  def show
  end

  private

  # def ransack_params
  #   Course.includes(:sections).ransack(params[:id])
  # end

  def set_course
    course_id = params[:id]
    @course = Course.find(course_id)
  end

  # def ransack_params
  #   Course.ransack(params[:q])
  # end

  # def course_params
  #   params.require(:user).permit(:title_or_number_cont, :sections_quarter_cont)
  # end
end


# Processing by CoursesController#index as HTML
#   Parameters: {"q"=>{"title_or_number_cont"=>"development", "sections_quarter_cont"=>""}, "commit"=>"Search"}
#   Rendering layout layouts/application.html.erb
#   Rendering courses/index.html.erb within layouts/application


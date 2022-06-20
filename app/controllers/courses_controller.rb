class CoursesController < ApplicationController
  before_action :set_course, only: %i[show]
  # protect_from_forgery with: :null_session, only: %i[search index]
  
  def search
    index
    render :index
  end
  
  def index
    # @courses = Course.all.order(:title)
    # @courses = Course.joins(:sections).where(sections: { academic_year: '2021-2022' }).distinct
    # @q = Course.joins(:sections).where(sections: { academic_year: '2021-2022' }).ransack(params[:q])
    # @courses = @q.result(distinct: true)
    # q = Course.clean_params(params[:q])
    # @sp = Course.clean_params(params)
    @q = Course.ransack({ 
      searchable_or_sections_searchable_cont: params[:search_bar],
      sections_program: params[:quarter]
      })
    @courses = @q.result(distinct: true).includes(:sections).current_sections
    # q = params[:q]
    # @courses = Course.ransack(searchable_or_sections_searchable_cont: q)
              #  .result(distinct: true)
              #  .includes(:sections)
              #  .current_sections
    # sections_id = Section.ransack(quarter_cont: q).result(distinct: true).pluck(:id)
    # shared_context = Ransack::Context.for(Course)
    # q = params[:q]
    # search_bar = Course.ransack(
    #   { searchable_or_sections_searchable_cont: q }, shared_context
    # )

    # q2 = params[:p]
    # search_day = Course.ransack(
    #   { searchable_or_sections_searchable_cont: q2 }, shared_context
    # )

    # shared_conditions = [search_bar, search_day].map { |search| 
    #   Ransack::Visitor.new.accept(search.base)
    # }

    # Course.joins(shared_context.join_sources)
    #   .where(shared_conditions.reduce(&:and))
    #   .to_sql
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


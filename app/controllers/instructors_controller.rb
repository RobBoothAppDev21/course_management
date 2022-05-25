class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all.order(:last_name)
  end
end
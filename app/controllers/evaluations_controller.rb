class EvaluationsController < ApplicationController

  def index
    @evaluations = Evaluation.all
  end
end
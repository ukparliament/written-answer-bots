class AnswerController < ApplicationController
  
  def index
    @answers = Question.all
  end
  
  def show
    answer = params[:answer]
    @answer = Question.find( answer )
  end
end

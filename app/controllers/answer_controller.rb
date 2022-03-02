class AnswerController < ApplicationController
  
  def index
    @answers = Question.all.limit( 20 )
  end
  
  def show
    answer = params[:answer]
    @answer = Question.find( answer )
  end
end

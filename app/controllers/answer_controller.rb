class AnswerController < ApplicationController
  
  def index
    @answers = Question.all.order( 'questions.pertinent_date desc' ).limit( 20 )
  end
  
  def show
    answer = params[:answer]
    @answer = Question.find( answer )
  end
end

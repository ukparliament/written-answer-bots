class AnswerController < ApplicationController
  
  def index
    @answers = Question.all.order( 'questions.date_answer_corrected desc, questions.date_answered desc' ).limit( 20 )
  end
  
  def show
    answer = params[:answer]
    @answer = Question.find( answer )
  end
end

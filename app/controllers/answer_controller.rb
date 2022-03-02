class AnswerController < ApplicationController
  
  def index
    @answers = Question.all
  end
end

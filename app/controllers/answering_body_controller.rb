class AnsweringBodyController < ApplicationController
  
  def index
  end
  
  def show
    answering_body = params[:answering_body]
    @questions = Question.all.where( "answering_body_id = #{answering_body}" )
  end
end

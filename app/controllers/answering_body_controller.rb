class AnsweringBodyController < ApplicationController
  
  def index
    @answering_bodies = AnsweringBody.all.order( 'name' )
  end
  
  def show
    answering_body = params[:answering_body]
    @questions = Question.all.where( "answering_body_id = #{answering_body}" )
  end
end

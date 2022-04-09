class AnsweringBodyController < ApplicationController
  
  def index
    @answering_bodies = AnsweringBody.all.order( 'name' )
  end
  
  def show
    answering_body = params[:answering_body]
    @answering_body = AnsweringBody.find_by_mnis_id( answering_body )
  end
end

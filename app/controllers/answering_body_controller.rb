class AnsweringBodyController < ApplicationController
  
  def index
    @answering_bodies = AnsweringBody.all.order( 'name' )
    
    @page_title = 'Answering bodies'
    @description = 'Answering bodies.'
    @crumb << {label: @page_title, url: nil}
    @section = 'answering-bodies'
  end
  
  def show
    answering_body = params[:answering_body]
    @answering_body = AnsweringBody.find_by_mnis_id( answering_body )
    @answers = @answering_body.questions
    
    @page_title = "#{@answering_body.name} - written answers"
    @multiline_page_title = "#{@answering_body.name} <span class='subhead'>Written answers</span>".html_safe
    @description = "Written answers from the #{@answering_body.name}."
    @rss_url = answering_body_answer_list_url( :format => 'rss' )
    @crumb << {label: 'Answering bodies', url: answering_body_list_url}
    @crumb << {label: @answering_body.name, url: nil}
    @section = 'answering-bodies'
    @subsection = 'answers'
    
    render :template => 'answering_body_answer/index'
  end
end

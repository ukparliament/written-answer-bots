class AnsweringBodyAnswerController < ApplicationController
  
  def index
    answering_body = params[:answering_body]
    @answering_body = AnsweringBody.find_by_mnis_id( answering_body )
    @answers = @answering_body.questions
    
    @page_title = "#{@answering_body.name} - written answers"
    @multiline_page_title = "#{@answering_body.name} <span class='subhead'>Written answers</span>".html_safe
    @description = "Written answers from the #{@answering_body.name}."
    @canonical_url = answering_body_show_url
    @rss_url = answering_body_answer_list_url( :format => 'rss' )
    @crumb << {label: 'Answering bodies', url: answering_body_list_url}
    @crumb << {label: @answering_body.name, url: answering_body_show_url}
    @crumb << {label: 'Written answers', url: nil}
    @section = 'answering-bodies'
    @subsection = 'answers'
  end
end

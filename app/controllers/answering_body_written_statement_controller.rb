class AnsweringBodyWrittenStatementController < ApplicationController

  def index
    answering_body = params[:answering_body]
    @answering_body = AnsweringBody.find_by_mnis_id( answering_body )
    @written_statements = @answering_body.written_statements
    
    @page_title = "#{@answering_body.name} - written statements"
    @multiline_page_title = "#{@answering_body.name} <span class='subhead'>Written statements</span>".html_safe
    @description = "Written statements from the #{@answering_body.name}."
    @rss_url = answering_body_written_statement_list_url( :format => 'rss' )
    @crumb << {label: 'Answering bodies', url: answering_body_list_url}
    @crumb << {label: @answering_body.name, url: answering_body_show_url}
    @crumb << {label: 'Written statements', url: nil}
    @section = 'answering-bodies'
    @subsection = 'written-statements'
  end
end

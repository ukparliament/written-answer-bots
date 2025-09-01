class AnswerController < ApplicationController
  
  def index
    @answers = Question.all.order( 'questions.pertinent_date desc' )
    @page_title = 'Written answers'
    @description = 'Written answers.'
    @rss_url = answer_list_url( :format => 'rss' )
    @crumb << {label: @page_title, url: nil}
    @section = 'written-answers'
  end
  
  def show
    answer = params[:answer]
    @answer = Question.find( answer )
    @page_title = @answer.title
    @description = @answer.title
    @crumb << {label: 'Written answers', url: answer_list_url}
    @crumb << {label: @answer.uin, url: nil}
    @section = 'written-answers'
  end
end

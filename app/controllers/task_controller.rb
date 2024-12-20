# We require the code.
require 'import/members'
require 'import/questions'
require 'cleanup'
require 'tweet/tweet'

# We include code from modules.
include Import::Members
include Import::Questions
include Cleanup
include TWEET

class TaskController < ApplicationController
  
  def task_import_members
    import_members
  end
  
  def task_import_questions
    import_questions
  end
  
  def task_cleanup
    cleanup
  end
  
  def task_tweet
    answering_body_id = params[:answering_body]
    tweet_set_up( answering_body_id.to_i )
  end
end

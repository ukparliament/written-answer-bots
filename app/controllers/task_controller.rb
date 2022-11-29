# We require the code.
require 'import/import_members'
require 'import/import_questions'
require 'import/cleanup'
require 'tweet/tweet'

# We include code from modules.
include IMPORT_MEMBERS
include IMPORT_QUESTIONS
include CLEANUP
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

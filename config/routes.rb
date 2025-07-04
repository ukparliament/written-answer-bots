Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/' => 'home#index', :as => 'root'
  get 'written-answers' => 'home#index', :as => 'home'
  
  get 'written-answers/members' => 'member#index', :as => 'member_list'
  
  get 'written-answers/answers' => 'answer#index', :as => 'answer_list'
  get 'written-answers/answers/:answer' => 'answer#show', :as => 'answer_show'
  
  get 'written-answers/written-statements' => 'written_statement#index', :as => 'written_statement_list'
  
  get 'written-answers/answering-bodies' => 'answering_body#index', :as => 'answering_body_list'
  get 'written-answers/answering-bodies/:answering_body' => 'answering_body#show', :as => 'answering_body_show'
  
  get 'written-answers/meta' => 'meta#index', :as => 'meta_list'
  get 'written-answers/meta/cookies' => 'meta#cookies', :as => 'meta_cookies'
  
  # An unfortuante duplication of the above.
  # Logs show someone is subscribing to the RSS at:
  # https://written-questions.herokuapp.com/answering-bodies/{answering_body.id}.rss
  # Which we don't want to break.
  get 'answering-bodies/:answering_body' => 'answering_body#show', :as => 'answering_body_show_old_url'
  
  get 'written-answers/tasks' => 'task#index', :as => 'task_index'
  get 'written-answers/tasks/import-members' => 'task#task_import_members', :as => 'task_import_members'
  get 'written-answers/tasks/import-questions' => 'task#task_import_questions', :as => 'task_import_questions'
  get 'written-answers/tasks/cleanup' => 'task#task_cleanup', :as => 'task_cleanup'
  get 'written-answers/tasks/tweet/:answering_body' => 'task#task_tweet', :as => 'task_tweet'
end

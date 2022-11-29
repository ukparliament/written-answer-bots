Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/' => 'home#index', :as => 'home'
  
  get 'members' => 'member#index', :as => 'member_list'
  
  get 'answers' => 'answer#index', :as => 'answer_list'
  get 'answers/:answer' => 'answer#show', :as => 'answer_show'
  
  get 'answering-bodies' => 'answering_body#index', :as => 'answering_body_list'
  get 'answering-bodies/:answering_body' => 'answering_body#show', :as => 'answering_body_show'
  
  get 'tasks' => 'task#index', :as => 'task_index'
  get 'tasks/import-members' => 'task#task_import_members', :as => 'task_import_members'
  get 'tasks/import-questions' => 'task#task_import_questions', :as => 'task_import_questions'
  get 'tasks/cleanup' => 'task#task_cleanup', :as => 'task_cleanup'
  get 'tasks/tweet/:answering_body' => 'task#task_tweet', :as => 'task_tweet'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  mount LibraryDesign::Engine => "/library_design"
  
  get '/' => 'home#index', :as => 'root'
  get 'written-answers' => 'home#index', :as => 'home'
  
  get 'written-answers/answers' => 'answer#index', :as => 'answer_list'
  
  get 'written-answers/written-statements' => 'written_statement#index', :as => 'written_statement_list'
  
  get 'written-answers/answering-bodies' => 'answering_body#index', :as => 'answering_body_list'
  get 'written-answers/answering-bodies/:answering_body' => 'answering_body#show', :as => 'answering_body_show'
  
  get 'written-answers/answering-bodies/:answering_body/answers' => 'answering_body_answer#index', :as => 'answering_body_answer_list'
  
  get 'written-answers/answering-bodies/:answering_body/written-statements' => 'answering_body_written_statement#index', :as => 'answering_body_written_statement_list'
  
  get 'written-answers/meta' => 'meta#index', :as => 'meta_list'
  get 'written-answers/meta/cookies' => 'meta#cookies', :as => 'meta_cookies'
  
  
  
  
  
  
  # No longer linked to.
  get 'written-answers/answers/:answer' => 'answer#show', :as => 'answer_show'
  get 'written-answers/members' => 'member#index', :as => 'member_list'
  
  # An unfortuante duplication of the above.
  # Logs show someone is subscribing to the RSS at:
  # https://written-questions.herokuapp.com/answering-bodies/{answering_body.id}.rss
  # Which we don't want to break.
  get 'answering-bodies/:answering_body' => 'answering_body#show', :as => 'answering_body_show_old_url'
end

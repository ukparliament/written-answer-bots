Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/' => 'home#index', :as => 'home'
  
  get 'members' => 'member#index', :as => 'member_list'
  
  get 'questions' => 'question#index', :as => 'question_list'
  
  get 'answering-bodies' => 'answering_body#index', :as => 'answering_body_list'
  get 'answering-bodies/:answering_body' => 'answering_body#show', :as => 'answering_body_show'
end

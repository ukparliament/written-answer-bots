Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'members' => 'member#index', :as => 'member_list'
  
  get 'questions' => 'question#index', :as => 'question_list'
end

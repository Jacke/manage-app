Manage::Application.routes.draw do
  #####
  # Auth
  #####
  devise_for :users, :skip => [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  ###########
  # Resources
  ###########
  resources :nexuses
  resources :lists
  resources :supliers
  root :to => 'nexuses#index'
end

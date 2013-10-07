Manage::Application.routes.draw do
  resources :nexus_reports
  resources :nexuses

  resources :lists
  resources :nexuse_reports, :only => [:index]
  get '/long' => 'nexuse_reports#long'

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
  ###########  resources :lists 
  
  get '/upload' => 'lists#upload', :as => :list_upload

  resources :supliers
  root :to => 'nexuse_reports#index'
end

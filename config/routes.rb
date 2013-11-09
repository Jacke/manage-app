Manage::Application.routes.draw do

###########
# Resources
###########
  resources :supliers
  resources :nexus_reports
  resources :nexuses
  resources :publishers
  resources :lists
  resources :users
  resources :items do
    member do
      get '/link' => 'items#link'
      get '/approve' => 'items#approve'
    end
  end
  put '/link_position' => 'items#link_position', :as => :link_position

  resources :item_types do
    resources :type_fields
  end

  resources :authors do
    resources :creations
  end
  ###################
  # Catalog & Reports
  ##################
  resources :nexuse_reports, :only => [:index]
  get '/long' => 'nexuse_reports#long'
  get '/category' => 'nexuse_reports#category', :as => :nexuse_category
  get '/category/new' => 'nexuse_reports#new_category', :as => :new_category

  post '/category/new' => 'nexuse_reports#create_category', :as => :create_category
  get '/category/edit/:id' => 'nexuse_reports#edit_category', :as => :edit_category
  delete '/category/delete/:id' => 'nexuse_reports#destroy', :as => :category
  get '/flush' => 'nexuses#destroy_all', :as => :flush_db

#####
# Auth
#####
  devise_for :users, :skip => [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end


  get '/upload' => 'lists#upload', :as => :list_upload
  
  root :to => 'nexuse_reports#index'
end

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
      patch '/update_fields' => 'items#update_fields'
      post '/update_fields' => 'items#update_fields'
    end
  end
  put '/link_position' => 'items#link_position', :as => :link_position

  resources :item_types do

    resources :type_fields, except: :show
  end
  get '/api_docs/' => 'api_docs#index', :as => :api_docs
  get '/api/items' => 'api_docs#items', :as => :api_items
  get '/api/positions' => 'api_docs#positions', :as => :api_positions
  get '/api/categories' => 'api_docs#category', :as => :api_category


  get '/category/authors' => 'nexuse_reports#authors_list'
  get '/creation/edit/:id' => 'creations#edit', :as => :edit_creat
  post '/creation/new' => 'creations#create', :as => :create_creat
  post '/creation/edit/:id' => 'creations#update', :as => :update_creat
  delete '/creation/delete/:id' => 'creations#destroy', :as => :destroy_creat
  get '/creation/new/' => 'creations#new', :as => :new_creat
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
    authenticated :user do
      root :to => 'nexuse_reports#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => "devise/sessions#new", as: :unauthenticated_root
    end
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  get '/upload' => 'lists#upload', :as => :list_upload
end

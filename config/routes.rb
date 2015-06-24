Rails.application.routes.draw do
  root 'static#index'
  
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/:id/projects', to: 'users#show'
  post 'project_users/new', to: 'project_users#create'


  resources :users
  resources :projects
  resources :project_users


  
end

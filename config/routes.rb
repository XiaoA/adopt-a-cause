Rails.application.routes.draw do
  
  root 'projects#index'

 
  get '/register', to: 'users#new'
  get '/update', to: 'users#edit'

  resources :users
end

Rails.application.routes.draw do
  
  root 'projects#index'
 
  get '/register', to: 'users#new'


  resources :users
end

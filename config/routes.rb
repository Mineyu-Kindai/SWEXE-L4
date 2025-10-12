Rails.application.routes.draw do
  get 'top/main'
  post 'top/login'
  root 'top#main'
  get 'top/logout'
  
  get 'top/new', to: 'top#new', as: 'top_new'
  post 'top/create', to: 'top#create', as: 'top_create'
  
  get "up" => "rails/health#show", as: :rails_health_check
end

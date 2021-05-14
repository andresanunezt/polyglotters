Rails.application.routes.draw do
  
  
  resources :users do
    
  resources :user_languages

  end


  resources :user_languages
  resources :languages

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get 'login', to: "sessions#new"

  post 'login', to: "sessions#create"

  delete 'logout', to: "sessions#destroy"


  get '/', to: "static#home", as: "home"
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
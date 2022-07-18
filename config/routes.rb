Rails.application.routes.draw do
  resources :comments
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#home'
  get 'about', to: 'welcome#about'
  resources :articles
  get '/capitalize', to: 'articles_controller#capitalize', as: 'capitalize'

end

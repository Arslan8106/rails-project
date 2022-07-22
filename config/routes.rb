Rails.application.routes.draw do
  resources :comments
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  # root 'users#new'
  get 'about', to: 'welcome#about'

  resources :articles
  get 'signup', to: 'users#new'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  
  post 'login', to: 'sessions#create'
  
  get 'logout', to: 'sessions#destroy'

end

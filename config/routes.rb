Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'pages/show', to: 'pages#show'
  get 'pages/about', to: 'pages#about'

  resources :articles

  get '/', to: 'pages#show'

  root :to => "pages#show"

  get 'signup', to: 'users#new'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

end

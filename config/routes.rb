Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'pages/show', to: 'pages#show'
  get 'pages/about', to: 'pages#about'

  resources :articles

  get '/', to: 'articles#new'

end

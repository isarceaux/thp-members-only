Rails.application.routes.draw do 

  get 'sessions/new'

  root to: 'static_pages#home'
  get 'static_pages/mysterious_page'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

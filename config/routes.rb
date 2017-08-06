Rails.application.routes.draw do
  root 'thing_to_dos#homepage'

  resources :thing_to_dos
  get 'Events/homepage', to: 'thing_to_dos#homepage'
  get  'users/new',      to: 'users#new'
  post 'users/create',   to: 'users#create'
  get  '/users/logout',  to: 'sessions#logout'
  post '/users/logout',  to: 'sessions#logout_now'
  get  '/users/login',   to: 'sessions#login'
  post '/users/login',   to: 'sessions#login_now'
end

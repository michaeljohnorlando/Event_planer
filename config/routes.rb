Rails.application.routes.draw do
  resources :thing_to_dos
  get 'Events/homepage', to: 'thing_to_dos#homepage'
  get  'users/new',      to: 'users#new'
  post 'users/create',   to: 'users#create'
end

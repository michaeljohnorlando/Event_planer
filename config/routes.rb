Rails.application.routes.draw do
  resources :thing_to_dos
  get  'users/new',    to: 'users#new'
  post 'users/create', to: 'users#create'
end

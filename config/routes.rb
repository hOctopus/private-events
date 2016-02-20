Rails.application.routes.draw do

  get     'signin'   => 'sessions#new'
  post    'signin'   => 'sessions#create'
  delete  'signout'  => 'sessions#destroy'

  resources :users
end

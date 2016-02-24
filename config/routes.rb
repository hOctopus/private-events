Rails.application.routes.draw do

  root    'events#index'

  get     'signin'   => 'sessions#new'
  post    'signin'   => 'sessions#create'
  delete  'signout'  => 'sessions#destroy'

  resources :users
#  resources :events, only: [:new, :create, :index, :show]

  resources :events do
    post :attending, on: :collection
  end
end

Rails.application.routes.draw do

  root :to => 'pets#index'
  devise_for :users, path: '',
                     path_names: {sign_in: 'login', sign_up: 'signup'}
  resources :pets, only: [:new, :create, :index, :show, :update, :destroy]
  get '/profile' => 'users#profile'

end

Rails.application.routes.draw do

  root :to => 'pets#index'
  devise_for :users, path: '',
                     path_names: {sign_in: 'login', sign_up: 'signup'}
  resources :pet, only: [:new, :create, :index, :show, :update, :destroy] 
end

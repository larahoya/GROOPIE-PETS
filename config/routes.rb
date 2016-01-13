Rails.application.routes.draw do
  root :to => 'site#home'
  devise_for :users, path: '',
                     path_names: {sign_in: 'login', sign_up: 'signup'} 
end

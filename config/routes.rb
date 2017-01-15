Rails.application.routes.draw do
  get    '/sign_up',  to: 'users#new'
  get    '/log_in',   to: 'sessions#new'
  post   '/log_in',   to: 'sessions#create'
  delete '/log_out',  to: 'sessions#destroy'
  resources :users

  root to: 'users#new'
end

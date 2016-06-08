Rails.application.routes.draw do
  resources :tags
  resources :short_stories
  resources :poems
  resources :profiles
  devise_for :users

  get '/profile', to: 'profiles#show'
  get '/profile/edit', to: 'profiles#edit'
  get '/exit', to: 'profiles#exit'
  patch '/profile', to: 'profiles#update'

  get '/profile/:profile_id/composers', to: 'profiles#composers', as: 'profile_composers'


  get '/composes', to: 'homes#index', as: 'composes'

  root to: 'profiles#show'


end

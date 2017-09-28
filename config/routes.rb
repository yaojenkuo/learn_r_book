Rails.application.routes.draw do
  resources :chapters
  resources :abouts, only: [:index]
  resources :events, except: [:show]
  root 'about#index'
end

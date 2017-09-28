Rails.application.routes.draw do
  resources :chapters
  resources :abouts, only: [:index]
  resources :events, except: [:show]
  resources :contacts, only: [:new, :create]
  root 'about#index'
end

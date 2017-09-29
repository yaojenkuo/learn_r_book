Rails.application.routes.draw do
  devise_for :users
  resources :chapters
  resources :abouts, only: [:index]
  resources :events, except: [:show]
  resources :contacts, only: [:new, :create]
  root 'about#index'

  get '*path' => redirect('/')
end

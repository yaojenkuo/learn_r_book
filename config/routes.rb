Rails.application.routes.draw do
  resources :chapters
  resources :abouts, only: [:index]
  root 'about#index'
end

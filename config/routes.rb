# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :followings, only: %i[create destroy]

  resources :opinions do
    member do
      get 'like'
      get 'unlike'
    end
  end

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'signup' => 'users#new'

  root to: 'welcome#index'
end

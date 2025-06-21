Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :practice_matches, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :likes, only: %i[create]
  end
  resources :notifications, only: [:index]
  resources :chat_rooms do
    resources :chat_messages, only: [:index, :create, :edit, :destroy]
  end
  post 'chat_rooms/find_or_create', to: 'chat_rooms#find_or_create', as: :find_or_create_chat_rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  


  # Defines the root path route ("/")
  root "practice_matches#index"
  resources :users, only: %i[new create]
  resource :profile, only: %i[new show edit create update]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end

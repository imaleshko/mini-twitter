Rails.application.routes.draw do
  root "home#index"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :posts, only: [ :create ]

  post "/follow/:id", to: "follows#create", as: "follow"
  delete "/unfollow/:id", to: "follows#destroy", as: "unfollow"

  resources :users, only: [ :index ]

  get "/messages/:user_id", to: "messages#index", as: "chat"
  post "/messages/:user_id", to: "messages#create"
end

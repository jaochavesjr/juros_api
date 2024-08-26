Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  post "/auth/login", to: "authentication#login"
  resources :customers
  resources :sales
  resources :plots, only: [ :update ]
end

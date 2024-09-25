Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # credential
      post "login", to: "sessions#create"
      delete "logout", to: "sessions#destroy"

      # admin services
      resources :admins, only: [ :index, :show, :create, :update, :destroy ]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "sample", to: "sample#data"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Custom route for 404 errors
  match "*unmatched", to: "application#not_found", via: :all
end

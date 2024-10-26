Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # credential
      post "login", to: "sessions#create"
      delete "logout", to: "sessions#destroy"
      
      resources :selected_invitations, only: [ :index, :show, :create, :update, :destroy ]

      resources :invitation_comments, only: [ :index, :show, :create, :update, :destroy ]
      resources :invitation_themes, only: [ :index, :show, :create, :update, :destroy ]
      resources :invitation_medias, only: [ :index, :show, :create, :update, :destroy ]
      resources :invitation_assets, only: [ :index, :show, :create, :update, :destroy ]
      resources :invitation_sheets, only: [ :index, :show, :create, :update, :destroy ]
      resources :invitation_desks, only: [ :index, :show, :create, :update, :destroy ]

      resources :timeline_sections, only: [ :index, :show, :create, :update, :destroy ]
      resources :story_timelines, only: [ :index, :show, :create, :update, :destroy ]
      resources :special_guests, only: [ :index, :show, :create, :update, :destroy ]
      resources :subscriptions, only: [ :index, :show, :create, :update, :destroy ]
      resources :theme_layouts, only: [ :index, :show, :create, :update, :destroy ]
      resources :user_guests, only: [ :index, :show, :create, :update, :destroy ]
      resources :theme_types, only: [ :index, :show, :create, :update, :destroy ]
      resources :admins, only: [ :index, :show, :create, :update, :destroy ]
      resources :roles, only: [ :index, :show, :create, :update, :destroy ]
      resources :users, only: [ :index, :show, :create, :update, :destroy ]
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"

  # Custom route for 404 errors
  match "*unmatched", to: "application#not_found", via: :all
end

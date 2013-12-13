Skeleton::Application.routes.draw do
  root :to => "front/items#index"

  namespace :front do
    resources :pages, :only => [:show]
    resources :items, :only => [:index, :show]
  end

  namespace :admin do
    root :to => "items#index"

    get "login", :to => "admin_user_sessions#new", :as => :login
    get "logout", :to => "admin_user_sessions#destroy", :as => :logout
    get "forgot_password", :to => "admin_user_sessions#forgot_password", :as => :forgot_password
    post "forgot_password", :to => "admin_user_sessions#forgot_password_send_email", :as => :forgot_password_send_email
    get "reset_password/:reset_password_code", :to => "admin_users#reset_password", :as => :reset_password
    put "reset_password/:reset_password_code", :to => "admin_users#reset_password_submit", :as => :reset_password_submit
    resources :admin_user_sessions, :only => [:new, :create, :destroy]

    resources :log_book_events, :only => [:index]
    resources :admin_users
    resources :items do
      get :log_book_events, :on => :member
      post :reorder, :on => :collection

      resources :pics, :only => [:index, :create, :destroy] do
        post :reorder, :on => :collection
      end
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, format: :json do
      match 'sign_in', controller: :sessions, action: :create, via: :post
      match 'sign_out', controller: :sessions, action: :destroy, via: :delete
      match 'sign_up', controller: :users, action: :create, via: :post
      resource :users, only: [:index, :show, :update] do
        resources :location, only: [:update]
        resources :games, only: [:update]
      end
      resources :conversations, only: [:index] do
        resources :messages, only: [:index, :create]
      end
      resources :users do
        resources :conversations, only: [:create]
        resource :contacts, only: [:create, :destroy]
      end
    end
  end
end

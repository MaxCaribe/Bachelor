Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'sign_in', to: 'account/sessions#create'
      delete 'sign_out', to: 'account/session#destroy'
      post 'sign_up', to: 'account/users#create'
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

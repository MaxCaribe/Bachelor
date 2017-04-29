Rails.application.routes.draw do
  namespace :api do
    namespace :v1, format: :json do
      match 'sign_in', controller: :sessions, action: :create, via: :post
      match 'sign_out', controller: :sessions, action: :destroy, via: :delete
      match 'sign_up', controller: :users, action: :create, via: :post
      resource :user, only: [:show, :update]
    end
  end
end

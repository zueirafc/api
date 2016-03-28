Rails.application.routes.draw do
  scope defaults: { format: :json } do
    root 'welcome#index'

    get 'welcome', action: :index, controller: :welcome

    # Error Handling
    scope via: :all do
      match '/404' => 'errors#not_found'
      match '/500' => 'errors#internal_server_error'
      match '/401' => 'errors#unauthorized'
    end

    mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: {
      omniauth_callbacks: 'api/v1/omniauth'
    }

    namespace :api do
      namespace :v1 do
        scope except: [:new, :edit] do
          resources :clubs
          resources :micropost_participants do
            get :targets, :trollers, on: :collection
          end

          resources :sources do
            get :inactive, :active, on: :collection
          end

          resources :users, only: :none, param: :email do
            get :exists, on: :member
          end

          resources :microposts do
            get :deleted, :pending, :reproved, :banned, :active, on: :collection
            post :delete, :ban, :activate, on: :member

            resources :media, only: :destroy
          end
        end
      end
    end
  end
end

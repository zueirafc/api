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

    namespace :api do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'

        scope except: [:new, :edit] do
          resources :clubs
          resources :sources do
            get :inactive, :active, on: :collection
          end

          resources :microposts do
            get :deleted, :pending, :banned, :active, on: :collection
            post :delete, :ban, :activate, on: :member
          end
        end
      end
    end
  end
end

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

    mount_devise_token_auth_for 'User', at: 'v1/auth'

    namespace :v1 do
      scope except: [:new, :edit] do
        resources :clubs
        resources :contacts

        resources :micropost_participants, only: :none do
          collection do
            get :targets
            get :trollers
          end
        end

        resources :micropost_fights, only: :none do
          get ':troller_nick_id/versus/:target_nick_id',
              action: :versus, on: :collection
        end

        resources :targets, only: :none do
          get :most_targeted, on: :collection
        end

        resources :sources do
          collection do
            get :inactive
            get :active
          end
        end

        resources :contact_categories do
          collection do
            get :inactive
            get :active
          end
        end

        resources :users, only: :none, param: :email do
          get :exists, on: :member
        end

        resources :microposts do
          collection do
            get :deleted
            get :pending
            get :reproved
            get :banned
            get :active
          end

          member do
            post :delete
            post :ban
            post :activate
          end

          resources :media, only: :destroy
        end

        resources :nickname_fans, only: :index do
          get :from_club, on: :member
        end
      end
    end
  end
end

Rails.application.routes.draw do
  scope defaults: { format: :json } do
    root 'welcome#index'

    get 'welcome', action: :index, controller: :welcome

    namespace :api do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'

        scope except: [:new, :edit] do
          resources :clubs
        end
      end
    end
  end
end

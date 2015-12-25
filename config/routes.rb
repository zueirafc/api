Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  scope defaults: { format: :json } do
    root 'welcome#index'

    get 'welcome', action: :index, controller: :welcome
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1, except: [:new, :edit] do
      resources :clubs
    end
  end
end

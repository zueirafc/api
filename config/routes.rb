Rails.application.routes.draw do
  scope defaults: { format: :json } do
    root 'welcome#index'

    get 'welcome', action: :index, controller: :welcome
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1, except: [:new, :edit] do
      # add the resources here!
    end
  end
end

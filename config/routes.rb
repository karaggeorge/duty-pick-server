Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    resources :rooms do
      resources :members
      resources :dates
      resources :picks
    end

    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
  end
end

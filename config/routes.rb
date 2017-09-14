Rails.application.routes.draw do
  resources :rooms do
    resources :members
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end

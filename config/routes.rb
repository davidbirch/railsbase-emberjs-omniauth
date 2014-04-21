Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :pages, only: [:index, :show]
    end
  end
  root 'index#index'
 
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'signin', to: 'sessions#new', as: 'signin'
end

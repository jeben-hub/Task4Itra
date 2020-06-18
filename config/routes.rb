Rails.application.routes.draw do
  resources :users do
    collection do
      get 'multiple_actions'
    end
  end
  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up
  root to: 'users#show'
  get '/block', to: 'users#block'
  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out
end

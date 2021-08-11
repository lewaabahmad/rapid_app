Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'common_pages#homepage'
  get '/dashboard', to: 'common_pages#dashboard'

  scope :admin do
    get '/users', to: 'admin_users#index'
    resources :pages, except: :show
  end

  get "*url", to: 'pages#show'
end

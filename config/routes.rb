Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'common_pages#home'
  get '/pricing', to: 'common_pages#pricing'
end

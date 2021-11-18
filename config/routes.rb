Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#index'

  resources :users, only: %i[new create]
  resources :meals, only: %i[new create edit update]
end

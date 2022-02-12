Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#top'

  get 'contact_us', to: 'static_pages#contact_us'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_use', to: 'static_pages#terms_of_use'

  get 'sitemap', to: redirect("https://easy-sugar-management.s3.ap-northeast-1.amazonaws.com/sitemap.xml.gz")

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create update show]
  resources :meals do
    resources :comments, only: %i[create destroy], shallow: true
    resource :apologize, only: %i[create], shallow: true
  end
end

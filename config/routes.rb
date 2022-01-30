Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'

  get 'contact_us', to: 'static_pages#contact_us'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_use', to: 'static_pages#terms_of_use'

  get '/sitemap', to: redirect("https://easy-sugar-management.s3.ap-northeast-1.amazonaws.com/sitemaps/sitemap.xml.gz")

  resources :users, only: %i[new create edit update]
  resources :meals
end

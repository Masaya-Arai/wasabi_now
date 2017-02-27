Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/about' => 'home#about_us'
  get '/terms' => 'home#terms_of_use'
  get '/privacy' => 'home#privacy_policy'
  get '/moderation' => 'home#moderation_policy'

  resources :category, only: :show
  resources :article, param: :hash_code, only: :show
end

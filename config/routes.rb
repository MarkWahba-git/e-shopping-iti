Rails.application.routes.draw do


  resources :products
  post 'auth/register' , to: 'users#register'
  post 'auth/login' , to: 'users#login'
  get 'muhammed' , to: 'users#muhammed'
  root 'home#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :categories
    resources :brands
    resources :products
    resources :stores
    resources :orders do
      resources :line_items
      end
  end
  
end

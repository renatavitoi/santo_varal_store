Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "user_registrations" }

  resources :products do
      resources :comments
    end

resources :users


  resources :orders, only: [:index, :show, :create, :destroy]

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  get 'products/index'
  get '/products/:users/1', to: 'products#show'
  get '/products', to: 'products#index'
  get '/sign_out' => 'users/sessions#destroy'

  post 'simple_pages/thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#landing_page'
end

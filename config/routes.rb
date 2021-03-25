Rails.application.routes.draw do
  namespace :admins do
    root 'homes#top'
    resources :genres
    resources :products
    resources :customers
  end
  scope module: "customers" do
    root 'homes#top'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resource :customers, only: %i[show edit update]
    resources :products
    patch 'cart_products/increase'
    patch 'cart_products/decrease'
    delete 'cart_products/destroy_all'
    resources :cart_products
    resources :delivery_addresses
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders, except: %i[edit update destroy]
  end
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
end

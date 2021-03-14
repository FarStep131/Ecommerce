Rails.application.routes.draw do
  namespace :admins do
    root 'homes#top'
  end
  scope module: "customers" do
    root 'homes#top'
  end
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admin do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

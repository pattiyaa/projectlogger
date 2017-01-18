Rails.application.routes.draw do
  

  resources :logs
  mount Ckeditor::Engine => '/ckeditor'
  resources :meetings
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users , :controllers => { 
  	:registrations => "users/registrations"
  }
  resources :projects do
    resources :meetings
    resources :logs
  end
  resources :clients
  resources :colleagues
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  root to: "home#index"
end

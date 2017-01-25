Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	  root 'static_pages#home'
	  get "shared/menu" => 'shared#menu', as: 'menu'

	  resources :pieces
	  resources :tags
end

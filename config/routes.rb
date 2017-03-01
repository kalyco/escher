Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/test_admin', as: 'rails_admin'
	  root 'static_pages#home'
	  get "shared/menu" => 'shared#menu', as: 'menu'
	  get "shared/test" => 'shared#test', as: 'test'

	  resources :pieces
	  resources :tags
end

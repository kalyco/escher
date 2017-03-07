Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	  root 'static_pages#home'
	  get "shared/menu" => 'shared#menu', as: 'menu'
	  get "shared/test" => 'shared#test', as: 'test'
	  resources :pieces
	  get "pieces/original_works" => "pieces/original_works", as: "originals"
	  resources :tags
end

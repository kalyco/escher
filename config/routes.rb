Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	  root 'static_pages#home'
	  get "shared/menu" => 'shared#menu', as: 'menu'
	  get "shared/test" => 'shared#test', as: 'test'
	  get "shared/gallery" => 'shared#gallery', as: 'gallery'
	  resources :pieces
	  get "pieces/original_works" => "pieces/original_works", as: "originals"

	  get "about" => "static_pages#about", as: "about"
	  get "techniques" => "static_pages#techniques", as: "techniques"
	  get "mezzotint" => "static_pages#mezzotint", as: "mezzotint"
	  get "original_print" => "static_pages#original_print", as: "original_print"
	  get "fakes_and_mistakes" => "static_pages#fakes_and_mistakes", as: "fakes_and_mistakes"

	  resources :tags
end

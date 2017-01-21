Rails.application.routes.draw do
	  root 'static_pages#home'
	  get "shared/menu" => 'shared#menu', as: 'menu'
end

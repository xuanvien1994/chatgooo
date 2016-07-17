Rails.application.routes.draw do
  resources :authentications
  resources :friendships
  resources :view
  devise_for :users, :controllers => {registrations: 'registrations'}
	root 'messages#index'
	# get  'messages#friend'
	get 'messages' => 'messages#friend'
	# index '' =>'messages#index'
	# get '/new_user' => 'static_pages#rooe', as: :new_user
	resource :messages, only: [:create, :new, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

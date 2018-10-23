Rails.application.routes.draw do

	root 'static_pages#landing_page'

	get 'signup', to: 'users#new'

	post 'signup', to: 'users#create'

	get 'login', to: 'sessions#new'

	post 'login', to: 'sessions#create'

	get 'show_event', to: 'events#show'

	get 'all_events', to: 'events#index'

	get 'create_event', to: 'events#new'

	post 'create_event', to: 'events#create'

	delete 'logout', to: 'sessions#destroy'

	get 'invite', to: 'event_invites#new'

	post 'invite', to: 'event_invites#create'

	patch '/', to: 'event_invites#update'

	delete '/', to: 'event_invites#destroy'

	resources :users
end

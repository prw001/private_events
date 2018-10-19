Rails.application.routes.draw do

	root 'static_pages#landing_page'

	get 'signup', to: 'users#new'

	post 'signup', to: 'users#create'

	get 'user', to: 'users#show'

	get 'login', to: 'sessions#new'

	post 'login', to: 'sessions#create'

	get 'show_event', to: 'events#show'

	get 'all_events', to: 'events#index'

	get 'create_event', to: 'events#new'

	post 'create_event', to: 'events#create'

	delete 'logout', to: 'sessions#destroy'
end

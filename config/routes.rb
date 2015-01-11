MotoRent::Application.routes.draw do

  resources :bookings
  get '/booking_:airport_id' => 'bookings#new', as: 'booking_airport'
  get '/dest_:airport' => 'bookings#book_dest', as: 'book_dest'
  match '/vehicletypes_booking_:passangers&:baggages&:from&:to', to: 'vehicletypes#vehicletypes_booking', via: 'get', as: 'vehicletypes_for_booking'


  resources :destination_fares

  resources :destinations
  match '/destination_booking', to: 'destinations#booking', via: 'get', as: 'destination_for_booking'

  resources :suppliers

  resources :airports
  resources :airports do
    collection { post :import }
  end
  match '/import_airports_form', to: 'airports#import_form', via: 'get', as: 'import_airports_form'

  resources :vehicletypes

  resources :reviews
  match '/all_reviews', to: 'reviews#index_site', via: 'get'

  resources :password_resets

  # OAuth
  match 'auth/:provider/callback', to: 'sessions#create_oauth', via: [:get, :post]
  # OAuth with token
  match 'auth/:provider/:invitation_token', to: 'sessions#create_oauth_with_token', via: [:get, :post]

  #match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'auth/failure', to: 'sessions#fail_oauth', via: [:get, :post]
  match 'signout', to: 'sessions#destroy_oauth', as: 'signout', via: [:get, :post]

  resources :blogs
  match '/create_blog', to: 'blogs#new', via: 'get'
  match '/all_blogs', to: 'blogs#index_site', via: 'get'


  resources :orders, only: [:index, :create, :new]
  match '/payment', to: 'orders#payment', via: 'get'

  # Payment status return
  match '/pay_status_paypal', to: 'orders#pay_status_paypal', via: 'get'

  resources :transactions, only: [:index, :create, :new]

  match '/access_deny', to: 'static_pages#access_deny', via: 'get'

  resources :users do
    member do
      get :following, :followers
    end
  end
  match '/unsubscribe', to: 'users#unsubscribe', via: 'get'
  match '/unsubscribe_action', to: 'users#unsubscribe_action', via: 'post'

  resources :sessions, only: [:new, :create, :destroy]
  root to: 'static_pages#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signup/:invitation_token', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/countries', to: 'static_pages#countries', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/partners', to: 'static_pages#partners', via: 'get'
  match '/transfers', to: 'static_pages#transfers', via: 'get'

end

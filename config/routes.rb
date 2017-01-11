Rails.application.routes.draw do
  get 'homes/show'

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'omniauth_callbacks' }

  resources :users do
  	member do
      get :watch_list
      get :add_movies
      get :add_to_watchlist
  	end
  end
  resources :movies do
  	member do
  		get :act
      get :add_act
      get :add_to_movie
      get :director
  	end
    resources :actors
    collection do
      get :opening_movies
    end
    resources :reviews
  end
  
  resources :actors

  resources :directors do 
    member do
      get :add_movies
      get :add_to_director
    end
  end

  resources :news

  resources :genre do 
    member do
      get :category
      get :add_movies
      get :add_to_genre
    end
  end

  resources :homes, only: [:show]

  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

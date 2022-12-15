Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'homes#top'

  get '/locale', to: 'languages#locale', as: 'locale'

  resources :dogs do
    collection do
      get 'search'
      get 'search_results'
      get 'matching_results'
    end
  end

  resources :user_choices

  resources :user_steps do
    collection do
      get 'first'
      get 'second'
      get 'third'
      get 'fourth'
      get 'fifth'
      get 'sixth'
      get 'matching_results'
    end
  end

  resources :users, only: [:show]

  resources :favorites, only: [:create, :destroy]

  resources :posts
end

Rails.application.routes.draw do
  root 'homes#index'

  resources :dogs do
    collection do
      get 'search'
      get 'search_results'
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :user_choices

  resources :user_steps do
    collection do
      get 'first'
      get 'second'
      get 'third'
      get 'fourth'
      get 'fifth'
      get 'sixth'
      get 'search_results'
    end
  end

  resources :users, only: [:show]
end

Rails.application.routes.draw do
  # root 'homes#index'

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

  resources :user_steps
end

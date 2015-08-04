Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, :controllers => { registrations: "registrations" }

  get '/users' => 'users#index', as: 'users'

  authenticated :user do
    root 'home#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :chats do
    resources :messages
  end
end

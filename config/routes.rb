Rails.application.routes.draw do
  root 'home#index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resources :treks, only: [:index, :destroy, :update]
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  resources :treks

  resources :users, controller: 'users', only: %i[index edit create update]

  get 'about' => "home#about", as: 'about'
  get 'instructions' => "home#instructions", as: 'instructions'
end

Rails.application.routes.draw do
  root "projects#index"

  resource :session, only: %i[new create destroy]
  resources :projects
  resources :users, only: %i[new create]

  get "about", to: "about#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

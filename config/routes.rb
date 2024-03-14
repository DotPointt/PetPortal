Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root "projects#index"

  resource :session, only: %i[new create destroy]
  resources :projects
  resources :users, only: %i[new create edit update]

  get "about", to: "about#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

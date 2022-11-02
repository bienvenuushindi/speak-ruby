Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/users", to: "users#index" # usually requires a view
  get "/users/:id", to: "users#show" # usually requires a view
  get "/users/:id/posts/:post_id", to: "posts#show" # single post for user id
  get "/users/:id/posts", to: "posts#index" # single post for user id
end

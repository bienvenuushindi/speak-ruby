Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/users", to: "users#index" # usually requires a view
  # get "/users/new", to: "users#new" # usually requires a view
  get "/users/:id", to: "users#show" # usually requires a view
  get "/users/:id/posts/:post_id", to: "users#find_post_by" # single post for user id
  get "/users/:id/posts", to: "users#find_posts" # single post for user id
  # post "/users", to: "users#create"  # usually a submitted form
  # get "/users/:id/edit", to: "users#edit" # usually requires a view
  # put "/users/:id", to: "users#update" # usually a submitted form
  # delete "/users/:id", to: "users#destroy" # usually called with a button
end

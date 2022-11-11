Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/", to: "users#index" # usually requires a view
  get "/users", to: "users#index", as: 'users' # usually requires a view
  get "/users/:id", to: "users#show", as: 'user' # usually requires a view
  get "/users/:id/posts/new", to: "posts#new", as: 'new_post'# new post for user id
  get "/users/:id/posts/:post_id", to: "posts#show", as: 'single_post' # single post for user id
  post "/users/:id/posts", to: "posts#create" # create single post for user id
  get "/users/:id/posts", to: "posts#index", as: 'user_posts' # single post for user id
  get "/users/:id/posts/:post_id/comments/new", to: "comments#new", as: 'new_comment'
  post "/users/:id/posts/:post_id/comments", to: "comments#create", as: 'user_posts_comments'
  get "/users/:id/posts/:post_id/likes", to: "likes#create", as: 'user_posts_likes'
end

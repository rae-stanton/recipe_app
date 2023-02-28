Rails.application.routes.draw do
  root 'static_pages#home'
  get  "/about",   to: "static_pages#about"
  get '/signup'  => 'users#new'
  resources :users
  get "/recipes/index"
  get "/recipes/show"
 end


# == Route Map
#

Rails.application.routes.draw do
  root 'static_pages#home'
  get  "/about", to: "static_pages#about"
  get "/signup", to: 'users#new'

  resources :users

  #get '/recipes', to: 'recipes#index'
  #post '/recipe', to: 'recipes#create'
  #get '/recipes/new', to: 'recipes#new'
  #get '/recipe/:id', to: 'recipes#show'
  #get 'recipe/:id/edit', to: 'recipes#edit'
  #delete 'recipe/:id', to: 'recipes#destroy'

  resources :recipes do
    member do
      post '/favorite', to: 'recipes#favorite'
      post '/unfavorite', to: 'recipes#unfavorite'
    end
  end

  resources :dashboard, only: %w[index show]
  resources :sessions
 end

# Need to get tutorial on HTTP Verbs
# Refresher on the Rails Router, and the "resources" method.

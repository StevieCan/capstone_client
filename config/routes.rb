Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get '/' => 'client/caddies#index'
  namespace :client do
    get '/caddies' => 'caddies#index'
    get '/caddies/new' => 'caddies#new'
    post '/caddies' => 'caddies#create'
    get '/caddies/:id' => 'caddies#show'
    delete '/caddies/:id' => 'caddies#destroy'

    get '/golfers' => 'golfers#index'
    get '/golfers/new' => 'golfers#new'
    post '/golfers' => 'golfers#create'
    get '/golfers/:id' => 'golfers#show'
    delete '/golfers/:id' => 'golfers#destroy'

    get '/tee_times' => 'tee_times#index'

  end

end

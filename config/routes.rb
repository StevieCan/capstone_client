Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/signup" => "golfers#new"
  post "/golfers" => "golfers#create"
  get "/signup" => "caddies#new"
  post "/caddies" => "caddies#create"

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

    get '/golfer_tee_times' => 'tee_times#golfer_index'
    get '/caddy_tee_times' => 'tee_times#caddy_index'
    get '/tee_times/:id' => 'tee_times#show'



  end

end

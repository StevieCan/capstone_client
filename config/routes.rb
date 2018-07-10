Rails.application.routes.draw do
  
  get "/client/golfer_signup" => "client/golfers#new"
  post "/client/golfer_signup" => "client/golfers#create"
  get "/client/caddy_signup" => "client/caddies#new"
  post "/client/caddy_signup" => "client/caddies#create"

  get "/golfer_login" => "sessions#golfer_new"
  post "/golfer_login" => "sessions#golfer_create"
  delete "/golfer_logout" => "sessions#golfer_destroy"

  get "/caddy_login" => "sessions#caddy_new"
  post "/caddy_login" => "sessions#caddy_create"
  delete "/caddy_logout" => "sessions#caddy_destroy"

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

Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/signup" => "users#new"
  post "/users" => "users#create"

  namespace :api do
    get 'caddies' => 'caddies#index'
    get 'caddies/new' => 'caddies#new'

  end

end

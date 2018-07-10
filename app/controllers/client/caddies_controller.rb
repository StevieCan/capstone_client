class Client::CaddiesController < ApplicationController

  def index
    client_params = {
                     search: params[:search],
                     sort_by: params[:sort_by],
                     sort_order: params[:sort_order],
                     category: params[:category]
                    }
    response = Unirest.get(
                           "http://localhost:3000/api/caddies",
                           parameters: client_params
                           )
    @caddies = response.body
    render 'index.html.erb'
  end


  def new
    @caddy = {}
    render 'new.html.erb'
  end

  def create
    client_params = {
                   name: params[:name],
                   email: params[:email],
                   phone_number: params[:phone_number],
                   username: params[:username],
                   ranking: params[:ranking],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation]
                  }
    response = Unirest.post(
                            "http://localhost:3000/api/caddies",
                            parameters: client_params
                            )
    
    if response.code == 200
      session[:caddy_id] = response.body["id"]
      flash[:success] = 'Successfully created account!'
      redirect_to '/caddy_login'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/client/caddy_signup'
    end
  end


  def show
    caddy_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/caddies/#{caddy_id}")
    @caddy = response.body
    render 'show.html.erb'
  end

  def destroy
    caddy_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/caddies/#{caddy_id}")
    redirect_to "/client/caddies"
  end

end

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
    @caddy = {
                   'name' => params[:name],
                   'email' => params[:email],
                   'phone_number' => params[:phone_number],
                   'password_digest' => params[:password_digest]
                  }

    response = Unirest.post(
                            "http://localhost:3000/api/caddies",
                            parameters: @caddy
                            )

    if response.code == 200
      flash[:success] = "Successfully created Caddy"
      redirect_to "/client/caddies/"
    elsif response.code == 401
      flash[:warning] = "You are not Authorized to add a caddy"
      redirect_to "/"
    else
      @errors = response.body["errors"]
      render 'new.html.erb'
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

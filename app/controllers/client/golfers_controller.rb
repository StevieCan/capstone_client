class Client::GolfersController < ApplicationController
  def index
    client_params = {
                    search: params[:search],
                    sort_by: params[:sort_by],
                    sort_order: params[:sort_order],
                    category: params[:category]
                    }
    response = Unirest.get(
                          "http://localhost:3000/golfers",
                          parameters: client_params
                          )
    @golfers = response.body
    render 'index.html.erb'

  end

  def new
    @golfer = {}
    render 'new.html.erb'
  end

  def create
    client_params = {
                      name: params[:name],
                      member_number: params[:member_number],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation]
                    }

    response = Unirest.post(
                            "http://localhost:3000/api/golfers", 
                            parameters: client_params
                            )
    
    if response.code == 200
      session[:golfer_id] = response.body["id"]
      flash[:success] = 'Successfully created account!'
      redirect_to '/golfer_login'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/client/golfer_signup'
    end
  end


  def show
    golfer_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/golfers/#{golfer_id}")
    @product = response.body
    render 'show.html.erb'
  end

  def destroy
    session[:jwt] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end



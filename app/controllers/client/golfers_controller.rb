class Client::GolfersController < ApplicationController
  def index
    client_params = {
                    search: params[:search],
                    sort_by: params[:sort_by],
                    sort_order: params[:sort_order],
                    category: params[:category]
                    }
    response = Unirest.get(
                          "http://localhost:3000/api/golfers",
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
    @golfer = {
                'name' => params[:name],
                'member_number' => params[:member_number],
                'email' => params[:email],
                'password_digest' => params[:password_digest]
    }
    response = Unirest.post(
                            "http://localhost:3000/api/golfers",
                            parameters: @golfer
      )
    if response.code == 200
      flash[:success] = "Successfully created Golfer"
      redirect_to "/client/golfers/"
    elsif response.code == 401
      flash[:warning] = "You are not Authorized to add a golfer"
      redirect_to "/"
    else
      @errors = response.body["errors"]
      render 'new.html.erb'
    end
  end

  def show
    golfer_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/golfers/#{golfer_id}")
    @product = response.body
    render 'show.html.erb'
  end

  def destroy
    golfer_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/golfers/#{golfer_id}")
    redirect_to "/client/golfers"
  end
end



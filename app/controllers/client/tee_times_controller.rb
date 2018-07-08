class Client::TeeTimesController < ApplicationController

  def golfer_index

    @tee_times = {
                start_time: params[:start_time],
                caddy_desired: params[:caddy_desired],
                number_of_holes: params[:number_of_holes]
                             }
    response = Unirest.get(
                           "http://localhost:3000/api/tee_times",
                           parameters: @tee_times
                           )

    render 'golfer_tee_times_index.html.erb'
  end 

  def caddy_index

    @tee_times = {
                start_time: params[:start_time],
                caddy_desired: params[:caddy_desired],
                number_of_holes: params[:number_of_holes]
                             }
    response = Unirest.get(
                           "http://localhost:3000/api/tee_times",
                           parameters: @tee_times
                           )

    render 'caddy_tee_times_index.html.erb'
  end 

  def new
    @tee_times = {}
    render 'new.html.erb'
  end

  def create
    client_params = {
                    start_time: params[:start_time],
                    caddy_desired: params[:caddy_desired],
                    number_of_holes: params[:number_of_holes]
                    }
    response = Unirest.post(
                            "http://localhost:3000/golfer_tee_times",
                            parameters: client_params
                            )
    
    if response.code == 200
      session[:golfer_id] = response.body["id"]
      flash[:success] = 'Successfully created tee time. Please arrive at least 30 minutes early!'
      redirect_to '/'
    else
      flash[:warning] = 'Please select another tee time'
      redirect_to '/golfer_tee_times'
    end
  end
end

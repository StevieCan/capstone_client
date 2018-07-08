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
end

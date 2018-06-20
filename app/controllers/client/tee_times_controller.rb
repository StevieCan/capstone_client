class Client::TeeTimesController < ApplicationController

  def index
    client_params = {
                    search: params[:search],
                    sort_by: params[:sort_by],
                    sort_order: params[:sort_order],
                    category: params[:category]
                    }
    response = Unirest.get(
                          "http://localhost:3000/api/tee_times",
                          parameters: client_params
                          )
    @tee_times = response.body
    render 'index.html.erb'

  end
end

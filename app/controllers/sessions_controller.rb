class SessionsController < ApplicationController
  def golfer_new
    render 'golfer_new.html.erb'
  end

  def caddy_new
    render 'caddy_new.html.erb'
  end

  def golfer_create
    client_params = {
                     auth: {
                            email: params[:email],
                            password: params[:password]
                           }
                     }     

    response = Unirest.post(
                            "http://localhost:3000/golfer_token", 
                            parameters: client_params
                            )
    
    if response.code == 201
      session[:jwt] = response.body["jwt"]
      flash[:success] = 'Successfully logged in!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/golfer_login'
    end
  end

  def caddy_create
    client_params = {
                     auth: {
                            email: params[:email],
                            password: params[:password]
                           }
                     }     

    response = Unirest.post(
                            "http://localhost:3000/caddy_token", 
                            parameters: client_params
                            )
    
    if response.code == 201
      session[:jwt] = response.body["jwt"]
      flash[:success] = 'Successfully logged in!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/caddy_login'
    end
  end

  def golfer_destroy
    session[:jwt] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/golfer_login'
  end

  def caddy_destroy
    session[:jwt] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/caddy_login'
  end
end

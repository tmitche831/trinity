class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(:username => params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      # raise params.inspect
      redirect_to bookings_path
    else
      flash[:notice] = "Invalid login. Please try again."
      redirect_to user_login_path
    end
  end

    def destroy
      session[:user_id] = nil
      redirect_to bookings_path
    end
end
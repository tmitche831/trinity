class UsersController < ApplicationController
  # before_action :check_if_logged_in, :except => [:new, :create]
  # before_action :check_if_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :user_id, :first_name, :last_name, :email)
  end
end
class UsersController < ApplicationController 
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def new
      @user = User.new
  end

  def create
      @user = User.create(user_params)
      if @user
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          redirect :new
      end
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
      session[:user_id] = nil  
      redirect_to login_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :tickets, :height, :nausea, :happiness, :admin)
  end
end
class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
  end

  def new
    if logged_in?
      redirect_to  user_path(current_user)
    else
      @user  = User.new
      render :new
    end
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to  user_path(user)
    else
      redirect_to new_user_path
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
  end
end

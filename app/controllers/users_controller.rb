class UsersController < ApplicationController

  def index
    @user = User.all
  end
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Congratulations. You've created a new account."
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update(user.params)
      flash[:notice] = "Your account profile has been updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :pasword, :phone_number)
  end
  
end

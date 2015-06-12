class UsersController < ApplicationController

  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
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
    @user.projects << @current_project
    if @user.update(user_params)
      flash[:notice] = "Your account profile has been updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def volunteer
    current_project = @current_project
    @user.projects = []
    @user.projects << current_project

    if @user.save
      flash[:notice] = "You did it!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    #    params.require(:user).permit(:username, :email, :password, :phone_number)
    params.require(:user).permit!
  end


end

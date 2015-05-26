class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session:[:user_id] = @user.id
      flash[:notice] = "Congratulations. You've created a new account."
      redirect_to root_path
    else
      render :new
    end
  end

end

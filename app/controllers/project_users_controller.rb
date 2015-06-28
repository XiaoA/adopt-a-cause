class ProjectUsersController < ApplicationController
  
  def index
    @project_user = ProjectUser.all
  end
  
  def show
    @project_user = ProjectUser.find(params[:id])
  end

  def new
  end

  def create
    @project_user = ProjectUser.new
    @user_id = params[:user_id]
    @project_id = params[:project_id]
    
    
    if @project_user.save
      flash.now[:notice] = "Congratulations. You've volunteered for a new project."
      redirect_to user_path(current_user)
    else
      flash.now[:error] = "Sorry, you've already volunteered for that project."
      redirect_to user_path(current_user)
    end
  end

  def edit
  end
  
  def update
    if @project_user.update
      flash[:notice] = "Your account profile has been updated."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def edit
  end

end



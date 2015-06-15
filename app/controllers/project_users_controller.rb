class ProjectUsersController < ApplicationController

  def index
    @project_user = ProjectUser.all
  end
  
  def show
    @project_user = ProjectUser.find_by(params[:project_user_params])
  end

  def new
    @project_user = ProjectUser.new
  end

  def create
    @project_user = ProjectUser.new(params[:project_user_params])
    
    if @project_user.save
      flash[:notice] = "Congratulations. You've volunteered for a new project."
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    if @project_user.update(params[:project_user_params])
      flash[:notice] = "Your account profile has been updated."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def edit
  end

  private

  def project_user_params
    params.require(:project_user).permit(:project_id, :user_id)
  end

  
end

  

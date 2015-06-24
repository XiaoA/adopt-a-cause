class ProjectUsersController < ApplicationController
  
  def index
    @project_user = ProjectUser.all
  end
  
  def show
    @project_user = ProjectUser.find(params[:id])
  end

  def new
    @project_user = ProjectUser.new
  end

  def create
    @project_user = ProjectUser.new(project_user_params)
    @user_id = params[:user_id]
    @project_id = params[:project_id]
    
    
    if @project_user.save
      flash[:notice] = "Congratulations. You've volunteered for a new project."
    #      redirect_to project_user_path(@project_user)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @project_user.update(project_user_params)
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
    params.permit(:project_user_id, :project_id, :user_id)
  end

end



class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.create
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      @project_users << current_user
      flash[:notice] = "Your project has been created."
      redirect_to projects_path(@project)
    else
      render :new
    end
  end
  
  def update
  end

  # def volunteer
  #   user_projects = @current_user.projects
  #   user_projects << @current_project
  #   if user_projects.save
  #     flash[:notice] = "You have volunteered for this project."
  #     redirect_to user_path
  #   else
  #     render :show
  #   end
  # end

  def volunteer
    current_project = @project
    current_user = @current_user
    current_user.projects << current_project

    if current_user.projects.save
      flash[:notice] = "You've volunteered for this project."
    else
      redirect_to user_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :project_description, :project_contact_person, :begin_date, :end_date)
  end
  
end

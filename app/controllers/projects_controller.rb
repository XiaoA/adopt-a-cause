class ProjectsController < ApplicationController

  def index
    @project = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project_user = current_user

    if @project.save
      flash[:notice] = "Your project has been created."
      redirect_to projects_path
    else
      render :new
    end
  end
  
  def update
  end

  def project_params
    params.require(:project).permit(:project_name, :project_description, :project_contact_person, :begin_date, :end_date)
  end
  
end

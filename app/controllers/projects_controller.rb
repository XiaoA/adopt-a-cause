class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def show
  end

  def new
    @project = Project.create
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Your project has been created."
      redirect_to projects_path
    else
      render :new
    end
  end
  
    def update
    end

    private

    def project_params
      params.require(:project).permit(:project_name, :project_description, :project_contact_person, :begin_date, :end_date)
    end
    
end

class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    project.status = "open"
    project.manager = current_user
    project.save
    ProjectMember.create(user: current_user, project: project)

    redirect_to projects_path
  end


  private

  def project_params
    params.require(:project).permit(:title, :description, :delivery_date)
  end

end

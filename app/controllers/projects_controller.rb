class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    if Project.find(params[:id]).users.include?(current_user)
      @project = Project.find(params[:id])
      @missions = Project.find(params[:id]).missions
    else
      redirect_to root_path
    end
  end

  def create
    project = Project.new(project_params)
    project.status = 0
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

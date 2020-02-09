class ProjectsController < ApplicationController
    before_action :is_member?, only: [:edit, :update, :show, :destroy]
    before_action :is_manager?, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
    @missions = Project.find(params[:id]).missions
  end

  def create
    project = Project.new(project_params)
    project.status = 0
    project.manager = current_user.id
    project.save
    ProjectMember.create(user: current_user, project: project)

    redirect_to projects_path
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)

    redirect_to project_path(project)
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy

    redirect_to projects_path
  end

  private

  def is_member?
    if Project.find(params[:id]).users.include?(current_user)
    else
      redirect_to root_path
    end
  end

  def is_manager?
    if Project.find(params[:id]).manager == current_user.id.to_s
    else
      redirect_to root_path
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, :delivery_date)
  end

end

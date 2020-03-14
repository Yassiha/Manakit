class TasksController < ApplicationController
  before_action :is_member?
  before_action :is_manager?, only: [:new, :create, :edit, :update, :destroy]

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.mission = Mission.find(params[:mission_id])
    task.save
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:start_date, :due_date, :title, :description, :priority, :status, :mission_id)
  end

  def is_member?
    if Project.find_by(id: params[:project_id]) != nil && Project.find_by(id: params[:project_id]).users.include?(current_user)
    else
      redirect_to root_path
    end
  end

  def is_manager?
    if Project.find_by(id: params[:project_id]) != nil && Project.find_by(id: params[:project_id]).manager == current_user
    else
      redirect_to root_path
    end
  end

end

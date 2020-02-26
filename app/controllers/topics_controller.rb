class TopicsController < ApplicationController
  before_action :is_member?, only: [:new]
  def new
    @topic = Topic.new
    @project = Project.find_by(id: params[:project_id])
    @mission = Mission.find_by(id: params[:mission_id])
  end

  def create
    topic = Topic.new(topic_params)
    topic.mission = Mission.find(params[:mission_id])
    topic.save

    redirect_to root_path
  end

  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    topic = Topic.find_by(id: params[:id])
    topic.destroy

    redirect_to root_path
  end

    private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def is_member?
    if Project.find_by(id: params[:project_id]) != nil && Project.find_by(id: params[:project_id]).users.include?(current_user)
    else
      redirect_to root_path
    end
  end

  def is_manager?
    if Project.find_by(id: params[:project_id]) != nil && Project.find_by(id: params[:project_id]).manager == current_user.id.to_s
    else
      redirect_to root_path
    end
  end
end

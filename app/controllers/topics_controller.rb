class TopicsController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private

  def topic_params
  end

  def is_member?
    if Project.find_by(id: params[:project_id]) != nil && Project.find_by(id: params[:project_id]).users.include?(current_user)
    else
      redirect_to root_path
    end
  end

  def is_manager?
  end
end

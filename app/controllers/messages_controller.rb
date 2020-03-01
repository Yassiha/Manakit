class MessagesController < ApplicationController
    before_action :is_member?

    def create
      content = params_messages[:content].html_safe
      message = Message.new(content: content)
      message.user = current_user
      message.topic = Topic.find(params[:topic_id])
      message.save
      redirect_to edit_project_mission_topic_path(message.topic.mission.project, message.topic.mission, message.topic)
    end

    def destroy
    end


    private

    def params_messages
      params.require(:message).permit(:content)
    end

    def is_member?
      if Project.find_by(id: params[:project_id]) != nil && Project.find_by(id: params[:project_id]).users.include?(current_user)
      else
        redirect_to root_path
      end
    end

end

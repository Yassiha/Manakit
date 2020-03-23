class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :status_color, :priority_color


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || projects_path
  end

  def status_color(item)
    if item.status == 100
      return "green"
    else
      return "gray"
    end
  end

  def priority_color(item)
    if item.priority == "Low"
      return "green"
    elsif item.priority == "Moderate"
      return "orange"
    elsif item.priority == "Critical"
      return "red"
    end
  end

end

class DashboardController < ApplicationController

  def show
    @projects = current_user.projects
    @missions_finished = 0
  end

end

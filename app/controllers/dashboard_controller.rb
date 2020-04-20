class DashboardController < ApplicationController

  def show
    @projects = current_user.projects
    @missions_finished = 0
    @tasks_finished = 0
  end

end

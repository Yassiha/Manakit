class DashboardController < ApplicationController

  def show
    @projects = current_user.projects
  end

end

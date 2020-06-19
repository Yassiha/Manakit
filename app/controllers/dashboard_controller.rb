class DashboardController < ApplicationController

  def show
    @projects = []
    @missions = []
    @tasks = []
    @topics = []

    if current_user.projects
      @projects << current_user.projects
    end

    if @projects[0]
      @projects[0].each do |project|
        if project.missions
          @missions << project.missions
        end
      end
    end

    if @missions[0]
      @missions[0].each do |mission|
        if mission.tasks
          @tasks << mission.tasks
        end
      end
    end

    if @missions[0]
      @missions[0].each do |mission|
        if mission.topics
          @topics << mission.topics
        end
      end
    end
  end

end

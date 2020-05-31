class DashboardController < ApplicationController

  def show
    a = []
    missions = []
    projects = current_user.projects

    projects.each do |project|
      a << project
    end


    projects.each do |project|
      project.missions.each do |mission|
        a << mission
        missions << mission
      end
    end

    missions.each do |mission|
      mission.tasks.each do |task|
        a << task
      end
    end

    missions.each do |mission|
      mission.topics.each do |topic|
        a << topic
      end
    end

    @array = a.sort_by(&:updated_at)

  end

end

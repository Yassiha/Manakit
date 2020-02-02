class Project < ApplicationRecord
  has_many :missions
  has_many :project_members
  has_many :users, through: :project_members
end

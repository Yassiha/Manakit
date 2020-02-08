class Project < ApplicationRecord
  has_many :missions
  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members
end

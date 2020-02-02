class Mission < ApplicationRecord
  belongs_to :project
  has_many :topics
  has_many :mission_members
  has_many :users, through: :mission_members
  has_many :tasks
end

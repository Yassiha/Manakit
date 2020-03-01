class Mission < ApplicationRecord
  belongs_to :project
  has_many :topics, dependent: :destroy
  has_many :mission_members, dependent: :destroy
  has_many :users, through: :mission_members
  has_many :tasks
end

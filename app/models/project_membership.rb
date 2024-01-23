class ProjectMembership < ApplicationRecord
  belongs_to: Project
  belongs_to: User
end

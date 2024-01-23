class User < ApplicationRecord
  has_many: ProjectMembership
  has_many: Project, :through => :ProjectMembership

end

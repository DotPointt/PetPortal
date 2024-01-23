class Project < ApplicationRecord
    has_many: ProjectMembership
    has_many: User, :through => :ProjectMembership

    validates :title, presence:true
end

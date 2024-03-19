module Resolvers
  class Project < Resolvers::BaseResolver
    argument :id, ID, required: true

    type Types::ProjectType, null: true

    def resolve(**options)
      ::Project.find_by(id: options[:id])
    end
  end
end

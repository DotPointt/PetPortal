module Resolvers
  class Projects < Resolvers::BaseResolver
    type [Types::ProjectType], null: false

    def resolve(**_options)
      ::Project.all
    end
  end
end

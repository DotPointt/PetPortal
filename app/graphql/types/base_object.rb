# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    private

    def current_user
      context[:current_user]
    end
    
    def authenticate!
      if current_user.blank?
        raise GraphiQL::ExecutionError, "Authentication failed, you must be signed in!"
      end
    end
  end
end

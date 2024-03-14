module Types
  class MutationType < Types::BaseObject
    field :login, Types::UserType, null: false, mutation: Mutations::Login 
    field :register, Types::UserType, null: false, mutation: Mutations::Register
  end
end

module Mutations
  class Register < BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(**kwargs)
      user = User.new(kwargs)
      if user.save 
        user.token = user.to_sgid(expires_in: 12.hours, for: 'graphql')
        user
      else
        raise GraphiQL::ExecutionError.new("Register Failed")
      end
    end
  end
end
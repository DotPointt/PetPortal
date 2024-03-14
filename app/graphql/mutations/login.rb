module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    
    def resolve(email:, password:)
      user = User.find_by(email: email)
      if user&.authenticate(password)
        user.token = user.to_sgid(expires_in: 12.hours, for: 'graphql')
        user
      else
        raise GraphiQL::ExecutionError.new("Invalid email or password")
      end 
    end
  end
end
  
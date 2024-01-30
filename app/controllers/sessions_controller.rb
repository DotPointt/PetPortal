class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new, create]

  def new 
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path, notice: "You've successfully loged in!"
    else
      edirect_to session_path, notice: "Error.."
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "You've successfully loged out!"
  end

end

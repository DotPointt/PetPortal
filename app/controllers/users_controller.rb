class UsersController < ApplicationController
  before_action :require_no_authentication

  skip_before_action :verify_authenticity_token  #разобраться с аутенсити токен
  
  def new
    @user = User.new  
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      redirect_to new_user_path
      flash.alert = "Oops.. something went wrong"
    end    
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
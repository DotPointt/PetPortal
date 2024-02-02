class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new, create]
  before_action :require_authentication, only: %i[edit, update]
  before_action :set_user!, only: %i[edit, update]

  #skip_before_action :verify_authenticity_token  
  #разобраться с аутенсити токен
  
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

  def edit 
  
  end

  def update 
  
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
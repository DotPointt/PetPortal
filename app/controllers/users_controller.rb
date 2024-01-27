class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token  #разобраться с аутенсити токен
  

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      redirect_to new_user_path
      flash.alert = "Oops.. something went wrong"
      # render :new   тимур я не понимаю как работает рендер( поэтому наколхозил, потом поменяю
    end

    
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
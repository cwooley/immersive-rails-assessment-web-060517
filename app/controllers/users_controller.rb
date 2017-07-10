class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Sign up successful"
      session[:user_id] = @user.id
      redirect_to guests_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end

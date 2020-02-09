class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    user = current_user
    user.name = username_params[:name].strip
    user.save
    redirect_to user_path
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  private

  def username_params
    params.require(:user).permit(:name)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

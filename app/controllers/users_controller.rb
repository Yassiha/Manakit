class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @error = ''
    user = current_user
    user.name = username_params[:name].strip if username_params[:name].nil? == false
    if password_params[:password].nil? == false
      if password_params[:password].length >= 6
        if password_params[:password] == password_params[:password_confirmation]
          user.password = password_params[:password]
        end
      end
    end
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

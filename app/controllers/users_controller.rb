class UsersController < ApplicationController

  def index
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :introduction)
  end
end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
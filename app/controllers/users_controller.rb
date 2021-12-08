class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_meal_path, success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :gender, :limit_level)
  end
end

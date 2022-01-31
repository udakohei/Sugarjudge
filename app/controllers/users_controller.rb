class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_meal_path, success: t('.success')
    else
      redirect_to root_path, danger: t('.failure')
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to new_meal_path, success: t('.success')
    else
      redirect_to root_path, danger: t('.failure')
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :gender, :limit_level)
  end
end

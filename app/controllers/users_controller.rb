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

  def edit
    if current_user && params[:id] == current_user.id.to_s
      @user = current_user
    elsif current_user && params[:id] != current_user.id.to_s
      redirect_to edit_user_path(current_user)
    else
      redirect_to new_user_path, danger: t('.failure')
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
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

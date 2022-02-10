class UsersController < ApplicationController
  def new
    @user = User.login.new
  end

  def show
    @user = User.find(params[:id])
    @meals = @user.meals.with_result.includes(:foods).order(created_at: :desc).page(params[:page]).per(24)
    @data_values = [@user.sum_limit, @user.sum_sugar]
  end

  def create
    @user = User.new(user_params)
    if @user.guest?
      if @user.save
        session[:user_id] = @user.id
        redirect_to new_meal_path, success: t('.success')
      else
        redirect_to root_path, danger: t('.failure')
      end
    elsif @user.login?
      if @user.save
        redirect_to login_path, success: t('.success')
      else
        flash.now[:danger] = t('.failure')
        render 'new'
      end
    else
      redirect_to root_path, danger: t('.not_authority')
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
    params.require(:user).permit(:name, :gender, :limit_level, :email, :password, :password_confirmation, :role)
  end
end

class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def create
    begin
        @meal = current_user.meals.build(meal_params)
      if @meal.save
        redirect_to root_path, success: t('.success')
      else
        flash.now[:danger] = t('.failure')
        render :new
      end
    rescue ActionController::ParameterMissing 
      redirect_to new_meal_path, danger: t('.failure')
    end
  end

  private
  
  def meal_params
    params.require(:meal).permit(:meal_image)
  end
end

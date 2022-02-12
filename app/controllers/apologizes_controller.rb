class ApologizesController < ApplicationController
  def create
    meal = using_user.meals.find(params[:meal_id])
    if meal.update(apologize: params[:apologize])
      redirect_to meal_path(meal), success: t('.success')
    else
      redirect_to meal_path(meal), danger: t('.failure')
    end
  end
end

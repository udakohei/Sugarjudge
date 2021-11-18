class MealsController < ApplicationController
  def show
    @meal = current_user.meals.find(params[:id])
  end
  def new
    @meal = Meal.new
  end

  def create
    begin
        @meal = current_user.meals.build(meal_params)
      if @meal.save
        redirect_to edit_meal_path(@meal), success: t('.success')
      else
        flash.now[:danger] = t('.failure')
        render :new
      end
    rescue ActionController::ParameterMissing
      redirect_to new_meal_path, danger: t('.need_image')
    end
  end

  def edit
    @meal = current_user.meals.find(params[:id])
    @foods = Food.all
  end

  def update
    @meal = current_user.meals.find(params[:id])
    food_ids = params[:meal][:food_ids]
    food_ids.shift
    if food_ids.present?
      food_ids.each do |food_id|
        @meal.used_foods.create!(food: Food.find(food_id))
      end
      @meal.update!(balance_of_payments: @meal.balance_of_payments)
      redirect_to meal_path(@meal), success: t('.success')
    else
      redirect_to edit_meal_path(@meal), danger: t('.need_select')
    end
  end

  private
  
  def meal_params
    params.require(:meal).permit(:meal_image)
  end
end

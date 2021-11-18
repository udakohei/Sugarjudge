class MealsController < ApplicationController
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
    food_ids.each do |food_id|
      @meal.used_foods.create(food: Food.find_by(id: food_id))
    end
  end

  private
  
  def meal_params
    params.require(:meal).permit(:meal_image)
  end
end

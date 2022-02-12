class MealsController < ApplicationController
  def index
    @meals = Meal.with_result.includes(:foods, :user).order(created_at: :desc).page(params[:page]).per(24)
  end

  def show
    @meal = Meal.find(params[:id])
    @data_values = [@meal.user.sugar_limit.round, @meal.sugar_intake]
    @comment = using_user.comments.new if using_user
    @comments = @meal.comments
  end
  
  def new
    @meal = Meal.new
  end

  def create
    begin
        @meal = using_user.meals.build(meal_params)
      if @meal.save
        sent_image = File.open(meal_params["meal_image"].tempfile)
        @meal.update!(analyzed_foods: @meal.image_analysis(sent_image))
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
    @meal = using_user.meals.find(params[:id])
    @concrete_foods = Food.searched_foods(@meal)
    @abstract_foods = Food.abstract
  end

  def update
    @meal = using_user.meals.find(params[:id])
    food_ids = params[:meal][:food_ids]
    food_ids.shift
    if food_ids.present?
      @meal.food_ids = food_ids
      @meal.update!(balance_of_payments: @meal.balance_of_payments_value, title: @meal.result_meal_title)
      @meal.update!(body: @meal.result_message)
      redirect_to meal_path(@meal), success: t('.success')
    else
      redirect_to edit_meal_path(@meal), danger: t('.need_select')
    end
  end

  def destroy
    @meal = using_user.meals.find(params[:id])
    @meal.destroy!
    redirect_to meals_path, success: t('.success')
  end

  private
  
  def meal_params
    params.require(:meal).permit(:meal_image)
  end
end

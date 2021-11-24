class MealsController < ApplicationController
  require "google/cloud/vision"
  require "google/cloud/translate/v2"

  def index

  end

  def show
    @meal = Meal.all.includes(:foods, :user).find(params[:id])
    @data_values = [@meal.user.required_calorie.round, @meal.calorie_intake]
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
    sent_image = File.open(@meal.meal_image.file.file)
    @analyzed_foods = image_analysis(sent_image)
    @foods = Food.all
  end

  def update
    @meal = current_user.meals.find(params[:id])
    food_ids = params[:meal][:food_ids]
    food_ids.shift
    if food_ids.present?
      food_ids.each do |food_id|
        @meal.used_foods.find_or_create_by!(food: Food.find(food_id))
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

  def image_analysis(meal_image)
    # image_path = File.expand_path('../', __FILE__)+"/steak.jpeg"

    image_annotator = Google::Cloud::Vision.image_annotator

    translate = Google::Cloud::Translate::V2.new

    response = image_annotator.label_detection(
      image:   meal_image,
    )

    results = []

    response.responses.each do |res|
      res.label_annotations.each do |label|
        translation = translate.translate label.description.downcase, to: 'ja'
        results << translation.text
        # puts label.description
      end
    end
    
    p results
  end
end

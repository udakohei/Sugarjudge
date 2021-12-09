class MealsController < ApplicationController
  require "google/cloud/vision"
  require "google/cloud/translate/v2"

  def index
    @meals = Meal.with_result.includes(:foods, :user).order(created_at: :desc)
  end

  def show
    @meal = Meal.all.includes(:foods, :user).find(params[:id])
    @data_values = [@meal.user.required_sugar.round, @meal.sugar_intake]
  end
  
  def new
    @meal = Meal.new
  end

  def create
    begin
        @meal = current_user.meals.build(meal_params)
      if @meal.save
        sent_image = File.open(@meal.meal_image.file.file)
        @meal.update!(analyzed_foods: image_analysis(sent_image))
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

    foods_from_foods = Food.concrete.search_foods(@meal.pass_to_sql)
    foods_from_genres = Genre.search_genres(@meal.pass_to_sql).map { |genre| genre.foods }
    searched_foods = foods_from_foods + foods_from_genres + Food.others
    @concrete_foods = searched_foods.flatten.uniq

    @abstract_foods = Food.abstract + Food.others
  end

  def update
    @meal = current_user.meals.find(params[:id])
    food_ids = params[:meal][:food_ids]
    food_ids.shift
    if food_ids.present?
      food_ids.each do |food_id|
        @meal.used_foods.find_or_create_by!(food: Food.find(food_id))
      end
      @meal.update!(balance_of_payments: @meal.balance_of_payments_value, title: @meal.result_meal_title)
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
    File.open("app/sample2.json", 'w') do |file|
      JSON.dump(Rails.application.credentials.google, file)
    end

    # if Rails.env.production?
    #   gcp_credentials = Rails.application.credentials.google.to_json
    #   ENV["GOOGLE_APPLICATION_CREDENTIALS"] = gcp_credentials
    # end

    ENV["GOOGLE_APPLICATION_CREDENTIALS"] = "app/sample2.json"
    # image_annotator = Google::Cloud::Vision.image_annotator do |config|
    #   config.credentials = gcp_credentials if Rails.env.production?
    # end

    # translate = Google::Cloud::Translate::V2.new do |config|
    #   config.credentials = gcp_credentials if Rails.env.production?
    # end
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
      end
    end
    
    results.join(',')

    File.delete("app/sample2.json")
  end
end

class CommentsController < ApplicationController
  def create
    comment = using_user.comments.build(comment_params)
    meal = Meal.find(params[:meal_id])
    if comment.save
      redirect_to meal_path(meal), success: t('.success')
    else
      redirect_to meal_path(meal), danger: t('.failure')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(meal_id: params[:meal_id])
  end
end

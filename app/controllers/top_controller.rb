class TopController < ApplicationController
  def top
    if current_user
      @user = current_user
    else
      @user = User.new
    end
  end
end

class TopController < ApplicationController
  def top
    if using_user
      @user = using_user
    else
      @user = User.guest.new
    end
  end
end

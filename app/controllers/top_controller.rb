class TopController < ApplicationController
  def top
    if guest_user
      @user = guest_user
    else
      @user = User.new
    end
  end
end

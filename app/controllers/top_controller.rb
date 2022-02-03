class TopController < ApplicationController
  def top
    if guest_user
      @user = guest_user
    else
      @user = User.guest.new
    end
  end
end

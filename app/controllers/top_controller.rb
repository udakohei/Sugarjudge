class TopController < ApplicationController
  def top
    @user = using_user || User.guest.new
  end
end

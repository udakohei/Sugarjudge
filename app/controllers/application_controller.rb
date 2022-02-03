class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  helper_method :using_user

  private

  def guest_user
    @guest_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def using_user
    @using_user ||= (current_user || guest_user)
  end
end

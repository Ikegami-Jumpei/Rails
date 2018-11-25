class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # class HelperImpl
  #   include ::Singleton
  #   include ::ApplicationHelper
  # end
  #
  # protected
  #
  # def helper
  #   return HelperImpl.instance
  # end

  def logged_in?
    !current_user.nil?
  end
end

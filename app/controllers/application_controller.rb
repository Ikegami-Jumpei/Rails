class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  class HelperImpl
    include ::Singleton
    include ::ApplicationHelper
  end

  protected

  def helper
    return HelperImpl.instance
  end

  def logged_in?
    !current_user.nil?
  end
end

class ApplicationController < ActionController::Base
  
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # explanation, at first current_user set to application_helper.rb
  # so that only available for views only, not at contoller.
  # with current_user set to application_controller.rb it will available
  # to controller, but now not available at views
  # to solve this solution we can add helper_method :current_user
  # now it will avaiable both views and controller

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end
end

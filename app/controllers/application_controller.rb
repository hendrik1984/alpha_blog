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
  # so it make the function logged_in? available to views
  # application_controller.rb => function will show only to xxx_controller.rb
  # application_helper.rb => function will show only to xxx.html.erb only
  # to make available on views add helper_method in application_controller.rb
  # example:
  # helper_method :logged_in? => this code will make views can use logged_in?
  # def logged_in? => this function only available on controller only
  #   !!current_user
  # end 

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end

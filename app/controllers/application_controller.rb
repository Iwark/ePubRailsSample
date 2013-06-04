class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :check_logined
  before_filter :allow_cross_domain_access

  private

  def check_logined
    unless session[:user_id] && User.find(session[:user_id])
    	redirect_to :root
    end
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Headers"] = "Content-Type"
    response.headers["Access-Control-Allow-Methods"] = "PUT,DELETE,POST,GET,OPTIONS"
  end

	helper_method :current_user
end

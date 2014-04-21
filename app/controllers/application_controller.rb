class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def notification(type,params)
  	config = {}
  	config[:value] 	 	 	= params[:value] || ''
  	config[:time]  	 	 	= params[:time]  || 2000
  	config[:image] 		 	= params[:image] || ''
  	config[:class_name] = "#{type}_notification"

  	gflash type.to_sym => config
  end
  helper_method :current_user, :notification
end

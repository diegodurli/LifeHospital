class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate, only: [:index, :show, :edit, :update, :destroy]

  private

  def current_user
		@current_user ||= User.exists?(session[:user_id]) if session[:user_id]
  end

  def notification(type,params)
  	config = {}
  	config[:value] 	 	 	= params[:value] || ''
  	config[:time]  	 	 	= params[:time]  || 2000
  	config[:image] 		 	= params[:image] || ''
  	config[:class_name] = "#{type}_notification"

  	gflash type.to_sym => config
  end

  def get_error_classes(object)
    if object && object.errors.any?
      return 'animated shake'
    end

    ''
  end

  def authenticate
    redirect_to login_url unless current_user
  end

  helper_method :current_user, :notification, :get_error_classes
end

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

  def get_error_classes(have_errors)
    'animated shake' if have_errors
  end

  def authenticate
    redirect_to login_url unless current_user
  end

  def get_columns_of(resources)
    if resources
      resources.first.attribute_names - %w{id created_at updated_at}
    else
      []
    end
  end

  def get_default_form_html_options(resource)
    {class: "form-signin #{get_error_classes(resource && resource.errors.any?)}", role: 'form'}
  end

  helper_method :current_user, :notification, :get_error_classes, :get_columns_of, :get_default_form_html_options
end

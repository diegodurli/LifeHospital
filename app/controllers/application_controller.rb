class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate, only: [:index, :show, :edit, :update, :destroy]

  before_action :set_model
  before_action :find_record, only: [:show, :edit, :update, :destroy]

  before_action only: [:show, :destroy, :index] do
    is_using_modal?(false)
  end

  before_action only: [:edit, :update, :create, :new] do
    is_using_modal?(true)
  end

  respond_to :html, :json, :js

  def index
    render partial: 'partials/index', locals: {records: find_records}, layout: 'layouts/application'
  end

  def new
    @record = @model.new
    render partial: 'partials/new'
  end

  def edit
    render partial: 'partials/edit'
  end

  def create
    @record = @model.new(eval("#{@table_name}_params"))

    if @record.save
      index_response('created')
    else
      action_error_response('new', @record)
    end
  end

  def update
    if @record.update(eval("#{@table_name}_params"))
      index_response('updated')
    else
      action_error_response('edit', @record)
    end
  end

  def destroy
    @record.destroy
    index_response('deleted')
  end

  private
    def set_model
      @model = self.controller_name.classify.constantize
      @table_name = @model.table_name.singularize
      @model_humanized = @model.table_name.singularize.humanize.titleize
    end

    def find_record
      @record = @model.find(params[:id])
    end

    def find_records
      @model.order(:id)
    end

    def index_response(action)
      notification 'success', {value: "#{@model_humanized} was successfully #{action}."}
      render partial: 'partials/index', locals: {records: find_records}
    end

    def action_error_response(action,record)
      notification 'error', {value: record.errors.full_messages.join('<br>')}
      render partial: "partials/#{action}"
    end

    def logged_user
      not current_user().new_record?
    end

    def current_user
      if session[:user_id]
  		  @current_user = User.find(session[:user_id])
      else
        @current_user = User.new
      end

      @current_user
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
      redirect_to login_url unless logged_user
    end

    def get_columns_of(resources)
      if not resources.empty?
        resources.first.attribute_names - %w{id created_at updated_at}
      else
        []
      end
    end

    def get_default_form_html_options(resource)
      {class: "form-signin #{get_error_classes(resource && resource.errors.any?)}", role: 'form'}
    end

    def is_using_modal?(value)
      @using_modal = value
    end

    def render_partial(action)
      render partial: action, layout: 'layouts/application'
    end

    def gravatar_url
      current_user().gravatar_url
    end

    helper_method :current_user, :notification, :get_error_classes, :get_columns_of, :get_default_form_html_options, :gravatar_url, :logged_user
end
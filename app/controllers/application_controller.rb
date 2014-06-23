class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate, only: [:index, :show, :edit, :update, :destroy]

  before_action :set_model, except: [:get_records, :get_details_for]
  before_action :find_record, only: [:show, :edit, :update, :destroy]

  before_action only: [:show, :destroy, :index] do
    is_using_modal?(false)
  end

  before_action only: [:edit, :update, :create, :new] do
    is_using_modal?(true)
  end

  respond_to :html, :json, :js

  def index
    respond_to do |format|
      format.html { render partial: 'partials/index', locals: {records: find_records}, layout: 'layouts/application' }
      format.json do
        render json: find_records().to_json
      end
      format.pdf do
        pdf = ReportPdf.new(find_records)
        send_data pdf.render, filename: "#{@model.table_name}_report.pdf", type: 'application/pdf'
      end
    end
  end

  def new
    @record = @model.new
    render partial: 'partials/new', locals: {label: @model_humanized}
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

  def get_records
    respond_to do |format|
      format.js { render partial: 'partials/show_records', locals: {resource: params[:name], class_to: params[:class_to]} }
      format.json do
        render json: find_records_from_string(params[:name]).to_json
      end
    end
  end

  def get_details_for
    patient = Patient.find(params[:patient_id])
    render partial: 'partials/show_details_for', locals: {patient: patient}
  end

  private
    def canAdd?(resource)
      ['Inventories','Inventory Movements'].include?(resource)
    end

    def canEdit?(resource)
      ['Medical Records','Inventory Movements'].include?(resource)
    end

    def canDelete?(resource)
      ['Medical Records','Inventories','Inventory Movements'].include?(resource)
    end

    def canGenerateReport?(resource)
      [''].include?(resource)
    end

    def list_records_for?(resource)
      ['Patients'].include?(resource)
    end

    def get_details_for?(resource)
      ['Medical Records'].include?(resource)
    end

    def get_details_for_patient(patient, resource)
      case resource
      when 'Hospitalizations'
        patient.hospitalizations.to_a
      when 'Clinical Outcomes'
        patient.medical_records.first.clinical_outcomes.to_a
      when 'Exams'
        patient.medical_records.first.exams.to_a
      when 'Procedures'
        patient.medical_records.first.procedures.to_a
      when 'Medicaments'
        medicaments = []
        patient.hospitalizations.each do |hospitalization|
          hospitalization.prescription.each do |prescription|
            prescription.medicaments.each do |medicament|
              medicaments.push(medicament)
            end
          end
        end
        medicaments
      when 'Diets'
        diets = []
        patient.hospitalizations.each do |hospitalization|
          hospitalization.diet.each do |diet|
            diets.push(diet)
          end
        end
        diets
      when 'Prescriptions'
        prescriptions = []
        patient.hospitalizations.each do |hospitalization|
          hospitalization.prescription.each do |prescription|
            prescriptions.push(prescription)
          end
        end
        prescriptions
      when 'Special Cares'
        special_cares = []
        patient.hospitalizations.each do |hospitalization|
          hospitalization.special_care.each do |special_care|
            special_cares.push(special_care)
          end
        end
        special_cares
      end
    end

    def createInventoryMovement(record,movement_type,quantity)
      @inventory = Inventory.find_or_create_by(description: "Inventory for #{record.description}")
      @inventory.inventory_movement.create(source: record.class.to_s, source_id: record.id, movement_type: movement_type, quantity: quantity, unit_value: quantity, total_value: quantity)

      if movement_type == 'IN'
        @inventory.total_value += quantity
      else
        @inventory.total_value -= quantity
      end

      @inventory.save
    end

    def set_model
      @model = self.controller_name.classify.constantize
      @table_name = @model.table_name.singularize
      @model_humanized = @table_name.humanize.titleize
    end

    def find_record
      @record = @model.find(params[:id])
    end

    def find_records
      if params[:patient]
        @model.where(patient_id: params[:patient])
      else
        @model.order(:id)
      end
    end

    def find_records_from_string(model)
      model.sub(' ','').classify.safe_constantize.order(:id)
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
  		  @current_user ||= User.find(session[:user_id])
      else
        @current_user ||= User.new
      end

      @current_user
    end

    def notification(type,params)
    	config = {}
    	config[:value] 	 	 	= params[:value] || ''
    	config[:time]  	 	 	= params[:time]  || 1500
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

    def get_columns_of(resource)
      if resource && resource.singularize.gsub(' ','').safe_constantize
        resource.singularize.gsub(' ','').safe_constantize.attribute_names - %w{id created_at updated_at}
      else
        []
      end
    end

    def get_default_form_html_options(resource)
      options = {class: "form-signin #{get_error_classes(resource && resource.errors.any?)}", role: 'form', new_record: resource.new_record?, resource: resource.class.to_s.pluralize.downcase, resource_id: resource.id}
    
      if resource.class == Prescription
        options = options.merge(linked_resource: 'medicaments')
      end

      options
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

    helper_method :current_user, :notification, :get_error_classes, :get_columns_of, :get_default_form_html_options, :gravatar_url, :logged_user, :find_records_from_string, :canDelete?, :canEdit?, :canAdd?, :list_records_for?, :get_details_for?, :get_details_for_patient, :canGenerateReport?
end
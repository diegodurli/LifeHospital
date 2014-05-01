class HospitalizationsController < ApplicationController
  before_action :set_hospitalization, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  # GET /hospitalizations
  # GET /hospitalizations.json
  def index
    @hospitalizations = Hospitalization.page(params[:page])
  end

  # GET /hospitalizations/1
  # GET /hospitalizations/1.json
  def show
  end

  # GET /hospitalizations/new
  def new
    @hospitalization = Hospitalization.new
  end

  # GET /hospitalizations/1/edit
  def edit
  end

  # POST /hospitalizations
  # POST /hospitalizations.json
  def create
    @hospitalization = Hospitalization.new(hospitalization_params)

    respond_to do |format|
      if @hospitalization.save
        format.html { redirect_to hospitalizations_url, notice: 'Hospitalization was successfully created.' }
        format.js   { redirect_to hospitalizations_url }
        format.json { render action: 'show', status: :created, location: hospitalizations_url }
      else
        format.html { render action: 'new' }
        format.js   { redirect_to hospitalizations_url }
        format.json { render json: @hospitalization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitalizations/1
  # PATCH/PUT /hospitalizations/1.json
  def update
    respond_to do |format|
      if @hospitalization.update(hospitalization_params)
        format.html { redirect_to hospitalizations_url, notice: 'Hospitalization was successfully updated.' }
        format.js   { redirect_to hospitalizations_url }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.js   { redirect_to hospitalizations_url }
        format.json { render json: @hospitalization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitalizations/1
  # DELETE /hospitalizations/1.json
  def destroy
    @hospitalization.destroy
    respond_to do |format|
      format.html { redirect_to hospitalizations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospitalization
      @hospitalization = Hospitalization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospitalization_params
      params.require(:hospitalization).permit(:location, :procedures, :treatments, :user_id, :medicalrecord_id)
    end
end

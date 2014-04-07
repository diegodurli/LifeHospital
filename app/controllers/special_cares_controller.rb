class SpecialCaresController < ApplicationController
  before_action :set_special_care, only: [:show, :edit, :update, :destroy]

  # GET /special_cares
  # GET /special_cares.json
  def index
    @special_cares = SpecialCare.all
  end

  # GET /special_cares/1
  # GET /special_cares/1.json
  def show
  end

  # GET /special_cares/new
  def new
    @special_care = SpecialCare.new
  end

  # GET /special_cares/1/edit
  def edit
  end

  # POST /special_cares
  # POST /special_cares.json
  def create
    @special_care = SpecialCare.new(special_care_params)

    respond_to do |format|
      if @special_care.save
        format.html { redirect_to @special_care, notice: 'Special care was successfully created.' }
        format.json { render action: 'show', status: :created, location: @special_care }
      else
        format.html { render action: 'new' }
        format.json { render json: @special_care.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_cares/1
  # PATCH/PUT /special_cares/1.json
  def update
    respond_to do |format|
      if @special_care.update(special_care_params)
        format.html { redirect_to @special_care, notice: 'Special care was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @special_care.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_cares/1
  # DELETE /special_cares/1.json
  def destroy
    @special_care.destroy
    respond_to do |format|
      format.html { redirect_to special_cares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_care
      @special_care = SpecialCare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_care_params
      params.require(:special_care).permit(:description, :desactivation, :hospitalization_id)
    end
end

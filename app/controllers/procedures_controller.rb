class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  # GET /procedures
  # GET /procedures.json
  def index
    @procedures = Procedure.page(params[:page])
  end

  # GET /procedures/1
  # GET /procedures/1.json
  def show
  end

  # GET /procedures/new
  def new
    @procedure = Procedure.new
  end

  # GET /procedures/1/edit
  def edit
  end

  # POST /procedures
  # POST /procedures.json
  def create
    @procedure = Procedure.new(procedure_params)

    respond_to do |format|
      if @procedure.save
        format.html { redirect_to procedures_url, notice: 'Procedure was successfully created.' }
        format.js   { redirect_to procedures_url }
        format.json { render action: 'show', status: :created, location: procedures_url }
      else
        format.html { render action: 'new' }
        format.js   { redirect_to procedures_url }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procedures/1
  # PATCH/PUT /procedures/1.json
  def update
    respond_to do |format|
      if @procedure.update(procedure_params)
        format.html { redirect_to procedures_url, notice: 'Procedure was successfully updated.' }
        format.js   { redirect_to procedures_url }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.js   { redirect_to procedures_url }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedures/1
  # DELETE /procedures/1.json
  def destroy
    @procedure.destroy
    respond_to do |format|
      format.html { redirect_to procedures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procedure_params
      params.require(:procedure).permit(:description, :observations, :scheduled, :medicalrecord_id)
    end
end

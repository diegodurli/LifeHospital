class ClinicalOutcomesController < ApplicationController
  before_action :set_clinical_outcome, only: [:show, :edit, :update, :destroy]

  # GET /clinical_outcomes
  # GET /clinical_outcomes.json
  def index
    @clinical_outcomes = ClinicalOutcome.all
  end

  # GET /clinical_outcomes/1
  # GET /clinical_outcomes/1.json
  def show
  end

  # GET /clinical_outcomes/new
  def new
    @clinical_outcome = ClinicalOutcome.new
  end

  # GET /clinical_outcomes/1/edit
  def edit
  end

  # POST /clinical_outcomes
  # POST /clinical_outcomes.json
  def create
    @clinical_outcome = ClinicalOutcome.new(clinical_outcome_params)

    respond_to do |format|
      if @clinical_outcome.save
        format.html { redirect_to @clinical_outcome, notice: 'Clinical outcome was successfully created.' }
        format.json { render action: 'show', status: :created, location: @clinical_outcome }
      else
        format.html { render action: 'new' }
        format.json { render json: @clinical_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinical_outcomes/1
  # PATCH/PUT /clinical_outcomes/1.json
  def update
    respond_to do |format|
      if @clinical_outcome.update(clinical_outcome_params)
        format.html { redirect_to @clinical_outcome, notice: 'Clinical outcome was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @clinical_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinical_outcomes/1
  # DELETE /clinical_outcomes/1.json
  def destroy
    @clinical_outcome.destroy
    respond_to do |format|
      format.html { redirect_to clinical_outcomes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinical_outcome
      @clinical_outcome = ClinicalOutcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinical_outcome_params
      params.require(:clinical_outcome).permit(:description, :observations, :status, :medicalrecord_id)
    end
end

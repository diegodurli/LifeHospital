class ClinicalOutcomesController < ApplicationController

  def index
    super
  end

  def show
  end

  def new
    super
  end

  def edit
    super
  end

  def create
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinical_outcome_params
      params.require(:clinical_outcome).permit(:description, :observations, :status, :medical_record_id)
    end
end
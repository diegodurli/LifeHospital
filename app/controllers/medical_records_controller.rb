class MedicalRecordsController < ApplicationController

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
    def medical_record_params
      params.require(:medical_record).permit(:description, :historic, :hospitalization_id)
    end
end
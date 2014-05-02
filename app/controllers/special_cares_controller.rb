class SpecialCaresController < ApplicationController

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
    def special_care_params
      params.require(:special_care).permit(:description, :desactivation, :hospitalization_id)
    end
end

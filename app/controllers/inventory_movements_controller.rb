class InventoryMovementsController < ApplicationController

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
    def inventory_movement_params
      params.require(:inventory_movement).permit(:inventory_id, :source, :source_id, :quantity, :unit_value, :total_value, :movement_type)
    end
end

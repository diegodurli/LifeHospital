class PrescriptionsController < ApplicationController

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

    if not @record.errors.any?
      @record.medicaments.each do |medicament|
        createInventoryMovement(medicament,'OUT',medicament.quantity)

        if @inventory.total_value <= medicament.inventory_min
          createInventoryMovement(medicament,'IN',medicament.quantity)
        end
      end
    end
  end

  def update
    super
  end

  def destroy
    super
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:quantity, :unit, :observation, :hospitalization_id)
    end
end

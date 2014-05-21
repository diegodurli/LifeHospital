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
      if params[:medicaments]
        params[:medicaments].split('|').each do |medicament|
          @record.medicaments << Medicament.find_by(description: medicament)
        end

        @record.medicaments.each do |medicament|
          createInventoryMovement(medicament, 'OUT', @record.quantity)

          if @inventory.total_value <= medicament.inventory_min
            createInventoryMovement(medicament, 'IN', 10)
          end
        end
      end
    end
  end

  def update
    super

    # We need to develop the Update of the Inventory/Medicament quantity!
  end

  def destroy
    super

    # We need to develop the Update of the Inventory/Medicament quantity!
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:quantity, :unit, :observation, :hospitalization_id, :medicaments)
    end
end

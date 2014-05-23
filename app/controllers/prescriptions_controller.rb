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
      set_prescription_medicaments(@record, params[:medicaments])

      @record.medicaments.each do |medicament|
        createInventoryMovement(medicament, 'OUT', @record.quantity)

        if @inventory.total_value <= medicament.inventory_min
          createInventoryMovement(medicament, 'IN', 10)
        end
      end
    end
  end

  def update
    super

    updateInventoryQuantity(@record, params[:medicaments])
  end

  def destroy
    super

    updateInventoryQuantity(@record, get_medicaments_list(@record))
  end

  def get_medicaments
    @prescription = Prescription.find(params[:id])
    @medicaments = @prescription.medicaments
    if @medicaments
      @medicaments = @medicaments.to_json
    end

    respond_to do |format|
      format.json do
        render json: @medicaments
      end
    end
  end

  private

    def get_medicaments_list(prescription)
      medicaments = []
      prescription.medicaments.each do |medicament|
        medicaments.push(medicament.description)
      end
      medicaments.join('|')
    end

    def set_prescription_medicaments(prescription, medicaments)
      prescription_medicaments = []
      if medicaments
        medicaments.split('|').each do |medicament|
          prescription_medicaments.push(Medicament.find_by(description: medicament))
        end
      end
      prescription.medicaments = prescription_medicaments
    end

    def updateInventoryQuantity(record, medicaments)
      return unless not record.errors.any?

      set_prescription_medicaments(record, medicaments)

      changes = record.previous_changes
      if changes && changes['quantity']
        @quantity_was = changes['quantity'][0]
        @quantity     = changes['quantity'][1]
      else
        @quantity_was = record.quantity
        @quantity     = 0
      end

      @medicaments = record.medicaments
      if @medicaments
        @medicaments.each do |medicament|

          # If the user changed the Medicament Quantity, we need to reflect this change in our Inventory
          if @quantity != @quantity_was
            movement_type = (@quantity - @quantity_was) > 0 ? 'OUT' : 'IN'
            createInventoryMovement(medicament, movement_type, (@quantity - @quantity_was).abs)
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:quantity, :unit, :observation, :hospitalization_id, :medicaments)
    end
end

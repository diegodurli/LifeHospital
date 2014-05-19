class MedicamentsController < ApplicationController

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
      createInventoryMovement(@record,'IN',@record.quantity)
    end
  end

  def update
    super
    updateInventoryQuantity(@record)
  end

  def destroy
    super
    updateInventoryQuantity(@record)
  end

  private

    def updateInventoryQuantity(record)
      changes = record.previous_changes
      if changes && changes['quantity']
        @quantity_was = changes['quantity'][0]
        @quantity     = changes['quantity'][1]
      else
        @quantity_was = record.quantity
        @quantity     = 0
      end

      # If the user changed the Medicament Quantity, we need to reflect this change in our Inventory
      if not record.errors.any? && (record.quantity != record.quantity_was)
        movement_type = (@quantity - @quantity_was) > 0 ? 'IN' : 'OUT'
        createInventoryMovement(record, movement_type, (@quantity - @quantity_was).abs)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicament_params
      params.require(:medicament).permit(:description, :dosage, :quantity, :inventory_min, :medical_record_id)
    end
end

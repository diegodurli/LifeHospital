class InventoryMovementsController < ApplicationController
  before_action :set_inventory_movement, only: [:show, :edit, :update, :destroy]

  # GET /inventory_movements
  # GET /inventory_movements.json
  def index
    @inventory_movements = InventoryMovement.all
  end

  # GET /inventory_movements/1
  # GET /inventory_movements/1.json
  def show
  end

  # GET /inventory_movements/new
  def new
    @inventory_movement = InventoryMovement.new
  end

  # GET /inventory_movements/1/edit
  def edit
  end

  # POST /inventory_movements
  # POST /inventory_movements.json
  def create
    @inventory_movement = InventoryMovement.new(inventory_movement_params)

    respond_to do |format|
      if @inventory_movement.save
        format.html { redirect_to @inventory_movement, notice: 'Inventory movement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inventory_movement }
      else
        format.html { render action: 'new' }
        format.json { render json: @inventory_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_movements/1
  # PATCH/PUT /inventory_movements/1.json
  def update
    respond_to do |format|
      if @inventory_movement.update(inventory_movement_params)
        format.html { redirect_to @inventory_movement, notice: 'Inventory movement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inventory_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_movements/1
  # DELETE /inventory_movements/1.json
  def destroy
    @inventory_movement.destroy
    respond_to do |format|
      format.html { redirect_to inventory_movements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_movement
      @inventory_movement = InventoryMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_movement_params
      params.require(:inventory_movement).permit(:inventory_id, :medicament_id, :quantity, :unit_value, :total_value, :type)
    end
end

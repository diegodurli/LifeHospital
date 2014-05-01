class RenameColumnTypeInventoryMovementsTable < ActiveRecord::Migration
  def change
  	rename_column :inventory_movements, :type, :movement_type
  end
end

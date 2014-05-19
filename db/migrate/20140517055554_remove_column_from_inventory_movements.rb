class RemoveColumnFromInventoryMovements < ActiveRecord::Migration
  def change
    remove_column :inventory_movements, :medicament_id, :integer
  end
end

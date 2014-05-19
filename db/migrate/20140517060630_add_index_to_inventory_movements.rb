class AddIndexToInventoryMovements < ActiveRecord::Migration
  def change
    add_index :inventory_movements, :source
    add_index :inventory_movements, :source_id
  end
end

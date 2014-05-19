class AddColumnToInventoryMovements < ActiveRecord::Migration
  def change
    add_column :inventory_movements, :source, :string
    add_column :inventory_movements, :source_id, :integer
  end
end

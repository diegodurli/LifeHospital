class CreateInventoryMovements < ActiveRecord::Migration
  def change
    create_table :inventory_movements do |t|
      t.references :inventory, index: true
      t.references :medicament, index: true
      t.integer :quantity
      t.decimal :unit_value
      t.decimal :total_value
      t.string :type

      t.timestamps
    end
  end
end

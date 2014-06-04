class CreateTableInventoryMovement < ActiveRecord::Migration
  def change
    create_table :inventory_movements do |t|
      t.references :inventory, index: true
      t.integer :quantity, default: 0,   null: false
      t.decimal :unit_value, default: 0.0, null: false
      t.decimal :total_value, default: 0.0, null: false
      t.string :movement_type
      t.string :source
      t.integer :source_id
      t.timestamps
    end

    add_index :inventory_movements, :source
    add_index :inventory_movements, :source_id
  end
end

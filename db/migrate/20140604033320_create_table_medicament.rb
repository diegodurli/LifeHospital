class CreateTableMedicament < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
      t.text :description
      t.decimal :dosage, default: 0.0, null: false
      t.integer :inventory_min, default: 0,   null: false
      t.integer :quantity, default: 0,   null: false
      t.references :medical_record, index: true
      t.timestamps
    end
  end
end

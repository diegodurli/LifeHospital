class CreateTablePrescription < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :quantity, default: 0, null: false
      t.string :unit
      t.text :observation
      t.references :hospitalization, index: true
      t.timestamps
    end
  end
end

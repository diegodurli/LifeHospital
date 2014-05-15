class CreateTablePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :quantity
      t.string :unit
      t.references :hospitalization, index: true
      t.references :medicament, index: true

      t.timestamps
    end
  end
end

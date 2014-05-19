class CreateMedicamentPrescriptions < ActiveRecord::Migration
  def change
    create_table :medicament_prescriptions do |t|
      t.references :medicament, index: true
      t.references :prescription, index: true

      t.timestamps
    end
  end
end

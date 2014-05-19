class RemoveColumnMedicamentFromPrescriptions < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :medicament_id, :integer
  end
end

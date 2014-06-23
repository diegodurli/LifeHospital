class RemoveMedicalRecordFromMedicaments < ActiveRecord::Migration
  def change
    remove_column :medicaments, :medical_record_id, :integer
  end
end

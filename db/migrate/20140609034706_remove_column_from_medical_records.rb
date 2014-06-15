class RemoveColumnFromMedicalRecords < ActiveRecord::Migration
  def change
    remove_column :medical_records, :hospitalization_id, :integer
  end
end

class RenameMedicalRecordInEveryTable < ActiveRecord::Migration
  def change
  	rename_column :clinical_outcomes, :medicalrecord_id, :medical_record_id
  	rename_column :exams, :medicalrecord_id, :medical_record_id
  	rename_column :hospitalizations, :medicalrecord_id, :medical_record_id
  	rename_column :medicaments, :medicalrecord_id, :medical_record_id
  	rename_column :procedures, :medicalrecord_id, :medical_record_id
  end
end

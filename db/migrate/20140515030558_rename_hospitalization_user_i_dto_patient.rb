class RenameHospitalizationUserIDtoPatient < ActiveRecord::Migration
  def change
  	rename_column :hospitalizations, :user_id, :patient_id
  end
end
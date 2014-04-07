class AddHospitalizationToMedicalRecord < ActiveRecord::Migration
  def change
    add_reference :medical_records, :hospitalization, index: true
  end
end

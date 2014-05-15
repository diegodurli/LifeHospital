class AddIndexTableHospitalizations < ActiveRecord::Migration
  def change
  	add_index :hospitalizations, :medical_record_id
  end
end

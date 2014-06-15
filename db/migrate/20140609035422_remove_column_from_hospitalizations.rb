class RemoveColumnFromHospitalizations < ActiveRecord::Migration
  def change
    remove_column :hospitalizations, :medical_record_id, :integer
  end
end

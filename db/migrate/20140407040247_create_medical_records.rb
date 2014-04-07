class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|
      t.text :description
      t.text :historic

      t.timestamps
    end
  end
end

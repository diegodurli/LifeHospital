class CreateTableMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|
      t.text :description
      t.text :historic
      t.references :hospitalization, index: true
      t.timestamps
    end
  end
end

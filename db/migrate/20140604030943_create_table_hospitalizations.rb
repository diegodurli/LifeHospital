class CreateTableHospitalizations < ActiveRecord::Migration
  def change
    create_table :hospitalizations do |t|
      t.text :location
      t.text :procedures
      t.text :treatments
      t.references :patient, index: true
      t.references :medical_record, index: true
      t.timestamps
    end
  end
end

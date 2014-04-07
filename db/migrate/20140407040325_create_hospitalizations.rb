class CreateHospitalizations < ActiveRecord::Migration
  def change
    create_table :hospitalizations do |t|
      t.text :location
      t.text :procedures
      t.text :treatments
      t.references :person, index: true
      t.references :medicalrecord, index: true

      t.timestamps
    end
  end
end

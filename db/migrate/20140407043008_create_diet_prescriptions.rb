class CreateDietPrescriptions < ActiveRecord::Migration
  def change
    create_table :diet_prescriptions do |t|
      t.references :diet, index: true
      t.references :prescription, index: true

      t.timestamps
    end
  end
end

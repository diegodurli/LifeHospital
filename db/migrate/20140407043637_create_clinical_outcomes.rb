class CreateClinicalOutcomes < ActiveRecord::Migration
  def change
    create_table :clinical_outcomes do |t|
      t.text :description
      t.text :observations
      t.string :status
      t.references :medicalrecord, index: true

      t.timestamps
    end
  end
end

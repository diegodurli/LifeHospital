class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.text :description
      t.text :observations
      t.boolean :scheduled
      t.references :medicalrecord, index: true

      t.timestamps
    end
  end
end

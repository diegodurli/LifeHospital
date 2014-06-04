class CreateTableProcedure < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.text :description
      t.text :observations
      t.boolean :scheduled
      t.references :medical_record, index: true
      t.timestamps
    end
  end
end

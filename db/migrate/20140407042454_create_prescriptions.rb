class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :quantity
      t.string :unit
      t.text :diet
      t.decimal :calories

      t.timestamps
    end
  end
end

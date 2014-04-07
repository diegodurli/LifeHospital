class CreateMedicaments < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
      t.text :description
      t.decimal :dosage
      t.integer :inventory_min
      t.references :medicalrecord, index: true

      t.timestamps
    end
  end
end

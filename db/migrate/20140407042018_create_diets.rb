class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.text :description
      t.references :hospitalization, index: true

      t.timestamps
    end
  end
end

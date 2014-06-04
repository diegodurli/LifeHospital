class CreateTableDiet < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.text :description
      t.references :hospitalization, index: true
      t.float :calories
      t.timestamps
    end
  end
end

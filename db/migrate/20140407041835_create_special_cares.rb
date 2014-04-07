class CreateSpecialCares < ActiveRecord::Migration
  def change
    create_table :special_cares do |t|
      t.text :description
      t.date :desactivation
      t.references :hospitalization, index: true

      t.timestamps
    end
  end
end

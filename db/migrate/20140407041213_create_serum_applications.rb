class CreateSerumApplications < ActiveRecord::Migration
  def change
    create_table :serum_applications do |t|
      t.references :serum, index: true
      t.references :hospitalization, index: true

      t.timestamps
    end
  end
end

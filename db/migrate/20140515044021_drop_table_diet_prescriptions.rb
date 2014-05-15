class DropTableDietPrescriptions < ActiveRecord::Migration
  def change
  	drop_table :diet_prescriptions
  end
end
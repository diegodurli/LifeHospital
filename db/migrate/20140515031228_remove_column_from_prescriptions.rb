class RemoveColumnFromPrescriptions < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :calories, :double
  end
end

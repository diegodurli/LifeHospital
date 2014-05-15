class RemoveColumnDietFromPrescriptions < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :diet, :string
  end
end

class AddColumnToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :observation, :text
  end
end

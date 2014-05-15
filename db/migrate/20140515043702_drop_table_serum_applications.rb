class DropTableSerumApplications < ActiveRecord::Migration
  def change
  	drop_table :serum_applications
  end
end

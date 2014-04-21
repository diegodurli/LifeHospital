class ChangePersonIdToUserIdInHospitalization < ActiveRecord::Migration
  def change
  	rename_column :hospitalizations, :person_id, :user_id  
  end
end

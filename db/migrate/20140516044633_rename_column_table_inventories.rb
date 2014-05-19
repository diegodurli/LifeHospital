class RenameColumnTableInventories < ActiveRecord::Migration
  def change
  	rename_column :inventories, :document, :description
  end
end

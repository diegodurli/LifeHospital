class AddColumnCaloriesToDiets < ActiveRecord::Migration
  def change
    add_column :diets, :calories, :double
  end
end

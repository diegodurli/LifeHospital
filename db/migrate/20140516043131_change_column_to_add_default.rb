class ChangeColumnToAddDefault < ActiveRecord::Migration
  def change
  	change_column :inventories, :total_value, :decimal, default: 0, null: false
  	change_column :inventory_movements, :quantity, :integer, default: 0, null: false
  	change_column :inventory_movements, :unit_value, :decimal, default: 0, null: false
  	change_column :inventory_movements, :total_value, :decimal, default: 0, null: false
  	change_column :medicaments, :dosage, :decimal, default: 0, null: false
  	change_column :medicaments, :quantity, :integer, default: 0, null: false
  	change_column :medicaments, :inventory_min, :integer, default: 0, null: false
  	change_column :prescriptions, :quantity, :integer, default: 0, null: false
  end
end

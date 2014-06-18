class ChangeColumnDefaultForAll < ActiveRecord::Migration
  def change
  	change_column :medicaments, :dosage, :decimal, :default => nil
  	change_column :medicaments, :inventory_min, :integer, :default => nil
  	change_column :medicaments, :quantity, :integer, :default => nil
  end
end

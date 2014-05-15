class AddColumnToMedicaments < ActiveRecord::Migration
  def change
    add_column :medicaments, :quantity, :integer
  end
end

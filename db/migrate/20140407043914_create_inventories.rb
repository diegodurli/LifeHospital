class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.decimal :total_value
      t.string :document

      t.timestamps
    end
  end
end

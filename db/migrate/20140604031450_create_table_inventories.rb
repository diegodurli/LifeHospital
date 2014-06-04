class CreateTableInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.decimal :total_value, default: 0.0, null: false
      t.string :description
      t.timestamps
    end
  end
end

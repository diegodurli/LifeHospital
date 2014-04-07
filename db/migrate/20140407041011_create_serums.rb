class CreateSerums < ActiveRecord::Migration
  def change
    create_table :serums do |t|
      t.text :description

      t.timestamps
    end
  end
end

class CreateTablePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :document
      t.string :email
      t.string :phone
      t.string :address
      t.string :contact
      t.timestamps
    end

    add_index :patients, :email
  end
end

class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :document
      t.string :phone
      t.string :address
      t.string :contact
      t.string :type

      t.timestamps
    end
  end
end

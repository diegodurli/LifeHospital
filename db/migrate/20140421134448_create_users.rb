class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
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

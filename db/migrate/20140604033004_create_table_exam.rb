class CreateTableExam < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.text :description
      t.text :observations
      t.text :archive
      t.boolean :scheduled
      t.references :medical_record, index: true
      t.timestamps
    end
  end
end

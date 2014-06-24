class ChangeColumnScheduledFromProceduresAndExams < ActiveRecord::Migration
  def change
  	add_column :procedures, :schedule, :date
  	remove_column :procedures, :scheduled

  	add_column :exams, :schedule, :date
  	remove_column :exams, :scheduled
  end
end

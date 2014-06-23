class ChangeColumnScheduledFromProceduresAndExams < ActiveRecord::Migration
  def change
  	change_column :procedures, :scheduled, :date
  	change_column :exams, :scheduled, :date

  	rename_column :procedures, :scheduled, :schedule
  	rename_column :exams, :scheduled, :schedule
  end
end

class Patient < ActiveRecord::Base
	has_many :hospitalizations
	has_many :medical_records
end
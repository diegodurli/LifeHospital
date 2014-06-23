class MedicalRecord < ActiveRecord::Base
	belongs_to :patient
	has_many :clinical_outcomes
	has_many :exams
	has_many :procedures
	validates_uniqueness_of :patient_id, message: 'already have a Medical Record.'
end

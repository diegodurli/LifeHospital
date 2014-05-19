class MedicalRecord < ActiveRecord::Base
	belongs_to :hospitalization
	has_many :clinical_outcomes
	has_many :exams
	has_many :medicaments
	has_many :procedures
	validates_uniqueness_of :hospitalization_id
end

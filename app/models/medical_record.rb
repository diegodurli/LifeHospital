class MedicalRecord < ActiveRecord::Base
	belongs_to :hospitalization
	has_many :clinical_outcome
	has_many :exam
	has_many :medicament
	has_many :procedure
	validates_uniqueness_of :hospitalization_id
end

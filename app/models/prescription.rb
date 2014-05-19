class Prescription < ActiveRecord::Base
	belongs_to :hospitalization
	has_many :medicament_prescriptions
	has_many :medicaments, through: :medicament_prescriptions
end

class Prescription < ActiveRecord::Base
	belongs_to :hospitalization
	has_many :medicament
end

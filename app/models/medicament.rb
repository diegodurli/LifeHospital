class Medicament < ActiveRecord::Base
  belongs_to :medical_record
  has_many :medicament_prescriptions
  has_many :prescriptions, through: :medicament_prescriptions

	def as_json(options={})
  	{value: self.description}
	end
end

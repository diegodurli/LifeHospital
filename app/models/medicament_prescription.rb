class MedicamentPrescription < ActiveRecord::Base
  belongs_to :medicament
  belongs_to :prescription
end

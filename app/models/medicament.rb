class Medicament < ActiveRecord::Base
  belongs_to :medical_record
  belongs_to :prescription
end

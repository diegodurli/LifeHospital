class DietPrescription < ActiveRecord::Base
  belongs_to :diet
  belongs_to :prescription
end

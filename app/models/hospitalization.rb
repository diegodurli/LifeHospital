class Hospitalization < ActiveRecord::Base
  belongs_to :person
  belongs_to :medicalrecord
end

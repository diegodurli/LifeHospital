class Hospitalization < ActiveRecord::Base
  belongs_to :user
  belongs_to :medicalrecord
end

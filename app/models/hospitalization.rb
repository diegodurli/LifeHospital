class Hospitalization < ActiveRecord::Base
  belongs_to :patient
  has_many :diet
  has_many :prescription
  has_many :special_care
end
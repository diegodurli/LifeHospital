class Patient < ActiveRecord::Base
	has_many :hospitalization
end
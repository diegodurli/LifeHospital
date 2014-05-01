class Inventory < ActiveRecord::Base
	validates_numericality_of :total_value, greater_than_or_equal_to: 0
end

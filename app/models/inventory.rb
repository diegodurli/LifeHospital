class Inventory < ActiveRecord::Base
	has_many :inventory_movement
	validates_numericality_of :total_value, greater_than_or_equal_to: 0
end

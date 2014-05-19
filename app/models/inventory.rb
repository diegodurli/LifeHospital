class Inventory < ActiveRecord::Base
	has_many :inventory_movement
end

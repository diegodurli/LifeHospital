class InventoryMovement < ActiveRecord::Base
  belongs_to :inventory
  has_one :medicament
end

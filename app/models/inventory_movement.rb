class InventoryMovement < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :medicament
end

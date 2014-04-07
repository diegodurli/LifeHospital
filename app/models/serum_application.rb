class SerumApplication < ActiveRecord::Base
  belongs_to :serum
  belongs_to :hospitalization
end

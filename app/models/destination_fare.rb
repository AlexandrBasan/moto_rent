class DestinationFare < ActiveRecord::Base
  belongs_to :destination
  belongs_to :vehicletype


  validates :vehicletype_id, presence: true
  validates :destination_id, presence: true
  validates :dest_fare, presence: true
end

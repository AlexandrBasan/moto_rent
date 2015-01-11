class Destination < ActiveRecord::Base
  belongs_to :airport
  has_many :destination_fares, :dependent => :destroy
  has_many :bookings

  validates :airport_id, presence: true
  validates :name, presence: true
end

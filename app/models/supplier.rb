class Supplier < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  validates :user_id, presence: true
  validates :address, presence: true
  validates :name, presence: true
end

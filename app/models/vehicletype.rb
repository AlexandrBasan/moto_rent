class Vehicletype < ActiveRecord::Base
  has_many :destination_fares, :dependent => :destroy

  validates :vtype, presence: true
  validates :vdescription, presence: true
  validates :image, presence: true
  validates :passnum, presence: true
  validates :bagagenum, presence: true
  validates :image, presence: true
  default_scope -> { order('created_at DESC') }
end

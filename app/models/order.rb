class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking
  validates :amount, presence: true
  validates :currency, presence: true
  validates :user_id, presence: true
  default_scope -> { order('created_at DESC') }

end

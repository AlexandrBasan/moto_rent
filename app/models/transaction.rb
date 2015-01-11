class Transaction < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true
  validates :currency, presence: true
  validates :operation, presence: true
  validates :inquiry_number, presence: true
  default_scope -> { order('created_at DESC') }
end

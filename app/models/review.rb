class Review < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: {minimum: 6}
  validates :title, presence: true, length: {minimum: 6}
  validates :review, presence: true, length: {minimum: 20}
  validates :show, presence: true
  VALID_DOMAIN_REGEX = /[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix
  validates :link, presence: true, format: { with: VALID_DOMAIN_REGEX }, length: {maximum: 254}
end

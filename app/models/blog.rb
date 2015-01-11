class Blog < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: {minimum: 6}
  validates :content, presence: true, length: {minimum: 20}
  #validates :role, presence: true
end

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplier
  belongs_to :destination
  belongs_to :airport
  has_one :order

  validates :airport_id, presence: true
  #validates :arrival_date, presence: true, :if => :step_1?

  #with_options :if => :step_1? do |book|
  #  book.validates :airport_id, presence: true
  #  book.validates :arrival_date, presence: true
  #end
  #with_options :if => :step_2? do |book|
  #  book.validates :vehicletype_id, presence: true
  #end

  def airport_name
    airport_id.try(:name)
  end

  def airport_name=(name)
    self.airport_id = Airport.find_by_name(name) if name.present?
  end


  def destination_name
    airport_id.try(:name)
  end

  def destination_name=(name)
    self.airport_id = Destination.find_by_name(name) if name.present?
  end

  attr_writer :current_step

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[1 2 3 4 5]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end

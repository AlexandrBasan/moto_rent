class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.paginate(page: params[:page])
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.arrival_address_line_1 = Destination.find_by_name(@booking.arrival_address_line_1).id

    respond_to do |format|
      if @booking.save

        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render action: 'show', status: :created, location: @booking }
      else
        format.html { render action: 'new' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @booking.arrival_address_line_1 = Destination.find_by_name(@booking.arrival_address_line_1).id

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:user_id, :supplier_id, :vehicletype_id, :booking_number, :airport_id, :status, :booking_type, :arrival_airline, :arrival_flight_number, :arrival_fliyng_from, :arrival_date, :departure_airlines, :departure_flight_number, :departure_date, :arrival_pick_up_time, :departure_pick_up_time, :price, :arrival_address_line_1, :arrival_address_line_2, :departure_address_line_1, :departure_address_line_2, :passengers, :baggages, :hand_laggages, :baby, :child, :booster, :special_requirements)
    end

end
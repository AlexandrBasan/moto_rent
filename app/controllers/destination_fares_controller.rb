class DestinationFaresController < ApplicationController
  before_action :set_destination_fare, only: [:show, :edit, :update, :destroy]

  # Check user role
  before_action :check_role_client, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  before_action :check_role_partner, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  # GET /destination_fares
  # GET /destination_fares.json
  def index
    @destination_fares = DestinationFare.paginate(page: params[:page])
  end

  # GET /destination_fares/1
  # GET /destination_fares/1.json
  def show
    if @destination_fare.vehicletype_id.nil? || @destination_fare.vehicletype_id == 0
      @vehicletype_type = I18n.t 'not_found'
    elsif Vehicletype.where(id: @destination_fare.vehicletype_id).take.nil?
      @vehicletype_type = I18n.t 'not_found'
    else
      @vehicletype_type = Vehicletype.where(id: @destination_fare.vehicletype_id).take.vtype
    end
    if @destination_fare.destination_id.nil? || @destination_fare.destination_id == 0
      @vehicletype_destination = I18n.t 'not_found'
    elsif Destination.where(id: @destination_fare.destination_id).take.nil?
      @vehicletype_destination = I18n.t 'not_found'
    else
      @vehicletype_destination = Destination.where(id: @destination_fare.destination_id).take.name
    end
  end

  # GET /destination_fares/new
  def new
    @destination_fare = DestinationFare.new
    @vehicletypes = Vehicletype.all
  end

  # GET /destination_fares/1/edit
  def edit
  end

  # POST /destination_fares
  # POST /destination_fares.json
  def create
    @vehicletypes = Vehicletype.all
    @destination_fare = DestinationFare.new(destination_fare_params)

    respond_to do |format|
      if @destination_fare.save
        format.html { redirect_to @destination_fare, notice: 'Destination fare was successfully created.' }
        format.json { render action: 'show', status: :created, location: @destination_fare }
      else
        format.html { render action: 'new' }
        format.json { render json: @destination_fare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destination_fares/1
  # PATCH/PUT /destination_fares/1.json
  def update
    respond_to do |format|
      if @destination_fare.update(destination_fare_params)
        format.html { redirect_to @destination_fare, notice: 'Destination fare was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @destination_fare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destination_fares/1
  # DELETE /destination_fares/1.json
  def destroy
    @destination_fare.destroy
    respond_to do |format|
      format.html { redirect_to destination_fares_url }
      format.json { head :no_content }
    end
  end

  # Check user role
  def check_role_client
    if (current_user && current_user.role == "Client") || (current_user && current_user.role == "OAuth")
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.access_deny_text'
    end
  end

  def check_role_partner
    if (current_user && current_user.role == "Partner") || (current_user && current_user.role == "OAuth")
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.access_deny_text'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination_fare
      @destination_fare = DestinationFare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_fare_params
      params.require(:destination_fare).permit(:vehicletype_id, :destination_id, :dest_fare)
    end
end

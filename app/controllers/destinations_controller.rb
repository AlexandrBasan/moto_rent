class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  # Check user role
  before_action :check_role_client, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  before_action :check_role_partner, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.paginate(page: params[:page])
  end

  def booking
    @destinations = Destination.order(:name).where("name like ? AND airport_id = ?", "%#{params[:term]}%", 3)
    render json: @destinations.map { |t| { :label => t.name, :value => t.id } }
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    if @destination.airport_id.nil? || @destination.airport_id == 0
      @airport_name = I18n.t 'not_found'
    elsif Airport.where(id: @destination.airport_id).take.nil?
      @airport_name = I18n.t 'not_found'
    else
      @airport_name = Airport.where(id: @destination.airport_id).take.name
    end
  end

  # GET /destinations/new
  def new
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(destination_params)

    respond_to do |format|
      if @destination.save
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @destination }
      else
        format.html { render action: 'new' }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url }
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
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:airport_id, :name, :address, :address_description, :avg_duration_min, :distance, :lat, :long)
    end
end

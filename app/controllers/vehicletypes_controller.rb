class VehicletypesController < ApplicationController
  before_action :set_vehicletype, only: [:show, :edit, :update, :destroy]

  # Check user role
  before_action :check_role_client, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  before_action :check_role_partner, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  # GET /vehicletypes
  # GET /vehicletypes.json
  def index
    @vehicletypes = Vehicletype.paginate(page: params[:page])
  end

  def vehicletypes_booking
    @vehicletypes = Vehicletype.all
    respond_to do |format|
        format.js
    end
  end

  # GET /vehicletypes/1
  # GET /vehicletypes/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /vehicletypes/new
  def new
    @vehicletype = Vehicletype.new
  end

  # GET /vehicletypes/1/edit
  def edit
  end

  # POST /vehicletypes
  # POST /vehicletypes.json
  def create
    @vehicletype = Vehicletype.new(vehicletype_params)

    respond_to do |format|
      if @vehicletype.save
        format.html { redirect_to @vehicletype, notice: 'Vehicletype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vehicletype }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicletype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicletypes/1
  # PATCH/PUT /vehicletypes/1.json
  def update
    respond_to do |format|
      if @vehicletype.update(vehicletype_params)
        format.html { redirect_to @vehicletype, notice: 'Vehicletype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicletype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicletypes/1
  # DELETE /vehicletypes/1.json
  def destroy
    @vehicletype.destroy
    respond_to do |format|
      format.html { redirect_to vehicletypes_url }
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
    def set_vehicletype
      @vehicletype = Vehicletype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicletype_params
      params.require(:vehicletype).permit(:vtype, :vdescription, :image, :passnum, :bagagenum)
    end
end

class AirportsController < ApplicationController
  before_action :set_airport, only: [:show, :edit, :update, :destroy]

  # Check user role
  before_action :check_role_client, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  before_action :check_role_partner, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  # GET /airports
  # GET /airports.json
  def index
    @airports = Airport.paginate(page: params[:page])
    respond_to do |format|
      format.html
      # format json for android app
      format.json { render json: @airports }
      format.xml { render xml: @airports }
      # export to csv and xls
      format.csv { send_data @airports.to_csv }
      format.xls { send_data @airports.to_csv(col_sep: "\t") }
    end
  end

  # import CSV rates
  def import_form
    @airports = Airport.all
    respond_to do |format|
      format.html
      # format json for android app
      format.json { render json: @airports }
      format.xml { render xml: @airports }
      # export to csv and xls
      format.csv { send_data @airports.to_csv }
      format.xls { send_data @airports.to_csv(col_sep: "\t") }
    end
  end

  def import
    if params[:file].nil?
      respond_to do |format|
        format.html { flash[:success] = ((t 'notice.file_format_error'))
        redirect_to airports_path }
      end
    else
      case File.extname(params[:file].original_filename)
        when ".csv" then
          Airport.import(params[:file])
          if Airport.check_import_errors == true
            respond_to do |format|
              format.html { flash[:success] = (t 'notice.import_success')
              redirect_to airports_path }
            end
          else
            @error_import = " Rows: "
            Airport.check_import_errors.each_with_index do |product, index|
              @error_import += "#{index} "
            end
            respond_to do |format|
              format.html { flash[:danger] = ((t 'notice.import_error') + @error_import)
              redirect_to airports_path }
            end
          end
        when ".xls", ".xlsx" then
          Airport.import(params[:file])
          if Airport.check_import_errors == true
            respond_to do |format|
              format.html { flash[:success] = (t 'notice.import_success')
              redirect_to airports_path }
            end
          else
            @error_import = " Rows: "
            Airport.check_import_errors.each_with_index do |product, index|
              @error_import += "#{product} "
            end
            respond_to do |format|
              format.html { flash[:danger] = ((t 'notice.import_error') + @error_import)
              redirect_to airports_path }
            end
          end
        else
          respond_to do |format|
            format.html { flash[:success] = ((t 'notice.file_format_error') + "#{params[:file].original_filename}")
            redirect_to airports_path }
          end
      end
    end

  end

  # GET /airports/1
  # GET /airports/1.json
  def show
  end

  # GET /airports/new
  def new
    @airport = Airport.new
  end

  # GET /airports/1/edit
  def edit
  end

  # POST /airports
  # POST /airports.json
  def create
    @airport = Airport.new(airport_params)

    respond_to do |format|
      if @airport.save
        format.html { redirect_to @airport, notice: 'Airport was successfully created.' }
        format.json { render action: 'show', status: :created, location: @airport }
      else
        format.html { render action: 'new' }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airports/1
  # PATCH/PUT /airports/1.json
  def update
    respond_to do |format|
      if @airport.update(airport_params)
        format.html { redirect_to @airport, notice: 'Airport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airports/1
  # DELETE /airports/1.json
  def destroy
    @airport.destroy
    respond_to do |format|
      format.html { redirect_to airports_url }
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
    def set_airport
      @airport = Airport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airport_params
      params.require(:airport).permit(:code, :cc_fips, :name, :lat, :long, :fixed_fare)
    end
end

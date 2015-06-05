class LocationsController < ApplicationController
  include LocationsHelper
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    #TODO: clear lat & long from previous search?
    

    #MARTA API URL source
    source = "http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus"

    #uses helper method to parse data into array pf hashes
    @buses = fetch_api_data(source)

    #Loop through all buses to find those that are nearby
    @nearby_buses = []
    @buses.each do |bus|
      if is_nearby(@location.latitude, @location.longitude, bus["LATITUDE"].to_f, bus["LONGITUDE"].to_f)
        @nearby_buses.push(bus)
      end #if
    end #each do
    @bus_count = @nearby_buses.length
      if @bus_count == 0
      redirect_to root_url, notice: "Dang. There aren't any buses serving that area right now." 
      end # if    
    
  end #show

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:address, :city, :latitude, :longitude)
    end
end

# Handles requests about locations
class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :inline_update, :destroy]

  # Lists all locations
  #
  # GET /locations
  #
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # Displays details of a location
  #
  # GET /locations/1
  #
  # GET /locations/1.json
  def show
  end

  # Display a form to create a new location
  #
  # GET /locations/new
  def new
    @location = Location.new
  end

  # Display a form to edit an existing location
  #
  # GET /locations/1/edit
  def edit
  end

  # Creates a new location from params
  #
  # Authorized parameters: :business_id, :lat, :lng, :name, :formatted_name
  #
  # POST /locations
  #
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

  # Update an existing location from params
  #
  # Authorized parameters: :business_id, :lat, :lng, :name, :formatted_name
  #
  # PATCH/PUT /locations/1
  #
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

  # Updates the location from inline form
  #
  # Should only called in AJAX
  #
  # TODO: Really needed ? Maybe update can be used
  #
  # POST /locations/1/inline_update
  def inline_update
    respond_to do |format|
      if @location.update(location_params)
        format.json { render :show, status: :ok, location: @location }
      else
        format.json { render json: { error: @location.errors }, status: :ok }
      end
    end
  end

  # Destroys a location
  #
  # DELETE /locations/1
  #
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Sets the location object required by the action
  def set_location
    @location = Location.find(params[:id])
  end

  # Filters the permitted params
  def location_params
    params.fetch(:location, {}  ).permit(:business_id, :lat, :lng, :name, :formatted_name)
  end
end

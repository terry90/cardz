# Handles the requests about businesses
class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # Lists all existing businesses
  #
  # GET /businesses
  #
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # Displays details of a business
  #
  # GET /businesses/1
  #
  # GET /businesses/1.json
  def show
  end

  # Displays a form to create a new business
  #
  # GET /businesses/new
  def new
    @business = Business.new
  end

  # Displays a form to edit an existing business
  #
  # GET /businesses/1/edit
  def edit
  end

  # Creates a new business from params
  #
  # Authorized parameters: :name
  #
  # POST /businesses
  #
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates an existing business from params
  #
  # Authorized parameters: :name
  #
  # PATCH/PUT /businesses/1
  #
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroys an existing business according to the :id parameter
  #
  # DELETE /businesses/1
  #
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Sets the business object required by the action
    def set_business
      @business = Business.find(params[:id])
    end

    # Filters the permitted params
    def business_params
      params.fetch(:business, {}).permit(:name)
    end
end

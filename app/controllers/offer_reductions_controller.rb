# Handles requests about offer reductions
class OfferReductionsController < ApplicationController
  before_action :set_offer_reduction, only: [:show, :edit, :update, :destroy]

  # Lists all the offer reductions
  #
  # GET /offer_reductions
  # GET /offer_reductions.json
  def index
    @location = Location.where(id: params[:location_id]).first
    @offer_reductions = @location ? @location.offer_reductions : OfferReduction.all
  end

  # Displays details of an offer reduction
  #
  # GET /offer_reductions/1
  # GET /offer_reductions/1.json
  def show
  end

  # Display a form to create a new offer reduction
  #
  # GET /offer_reductions/new
  def new
    @offer_reduction = OfferReduction.new
  end

  # Display a form to edit an existing offer reduction
  #
  # GET /offer_reductions/1/edit
  def edit
  end

  # Creates a new offer reduction from params
  #
  # Authorized parameters: :name, :percent, :uid, :location_id, :description, :title
  #
  # POST /offer_reductions
  # POST /offer_reductions.json
  def create
    @offer_reduction = OfferReduction.new(offer_reduction_params)

    respond_to do |format|
      if @offer_reduction.save
        format.html { redirect_to @offer_reduction, notice: 'Offer reduction was successfully created.' }
        format.json { render :show, status: :created, location: @offer_reduction }
      else
        format.html { render :new }
        format.json { render json: @offer_reduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates an existing offer reduction from params
  #
  # Authorized parameters: :name, :percent, :uid, :location_id, :description, :title
  #
  # PATCH/PUT /offer_reductions/1
  # PATCH/PUT /offer_reductions/1.json
  def update
    respond_to do |format|
      if @offer_reduction.update(offer_reduction_params)
        format.html { redirect_to @offer_reduction, notice: 'Offer reduction was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer_reduction }
      else
        format.html { render :edit }
        format.json { render json: @offer_reduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroy an offer reduction
  #
  # DELETE /offer_reductions/1
  # DELETE /offer_reductions/1.json
  def destroy
    @offer_reduction.destroy
    respond_to do |format|
      format.html { redirect_to offer_reductions_url, notice: 'Offer reduction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Sets the offer reduction object required by the action
  def set_offer_reduction
    @offer_reduction = OfferReduction.find(params[:id])
  end

  # Filters the permitted params
  def offer_reduction_params
    params.require(:offer_reduction).permit(:name, :percent, :uid, :location_id, :description, :title)
  end
end

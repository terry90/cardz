# Handles the requests about cards
class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # Lists all existing cards
  #
  # GET /cards
  #
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # Display details of a card
  #
  # GET /cards/1
  #
  # GET /cards/1.json
  def show
  end

  # Display a form to create a new card
  #
  # GET /cards/new
  def new
    @card = Card.new
  end

  # Display a form to edit an existing card
  #
  # GET /cards/1/edit
  def edit
  end

  # Creates a new card from params
  #
  # Authorized parameters: :uid, :user_id, :location_id
  #
  # POST /cards
  #
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates an existing card from params
  #
  # Authorized parameters: :uid, :user_id, :location_id
  #
  # PATCH/PUT /cards/1
  #
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroys a card
  #
  # DELETE /cards/1
  #
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Sets the card object required by the action
    def set_card
      @card = Card.find(params[:id])
    end

    # Filters the permitted params
    def card_params
      params.fetch(:card, {}).permit(:uid, :user_id, :location_id)
    end
end

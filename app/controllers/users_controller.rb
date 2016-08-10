# Handles requests about users
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_has_rights, only: [:show, :edit, :update, :destroy]

  # Lists all users
  #
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # Displays the details of a user
  #
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # Display a form to create a new user
  #
  # GET /users/new
  def new
    @user = User.new
  end

  # Display a form to edit an existing user
  #
  # GET /users/1/edit
  def edit
  end

  # Creates a new user from params
  #
  # Authorized parameters: :email, :first_name, :last_name, :address, :postal_code, :city, :phone_number
  #
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if params[:user][:cards_attributes]
        cards = []
        params[:user][:cards_attributes].each do |_, v|
          card = Card.where(uid: v[:uid]).first
          cards << card if card && v[:_destroy] == 'false'
        end
        @user.cards = cards.uniq
      end
      if @user.save
        format.html { redirect_to @user, notice: t('user.create.success') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates an existing user from params
  #
  # Authorized parameters: :email, :first_name, :last_name, :address, :postal_code, :city, :phone_number
  #
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if params[:user][:cards_attributes]
        cards = []
        params[:user][:cards_attributes].each do |_, v|
          card = Card.where(uid: v[:uid]).first
          cards << card if card && v[:_destroy] == 'false'
        end
        @user.cards = cards.uniq
      end
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('user.update.success') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroys a user
  #
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t('user.destroy.success') }
      format.json { head :no_content }
    end
  end

  # Will replace the form on homepage
  #
  # Try to find an existing user
  #
  # POST /user/preform
  def preform
    @user = User.find_by(email: params[:email]) || User.new(email: params[:email])
    render partial: @user.persisted? ? 'form_password' : 'form_card_uid'
  end

  # Checks if card is valid and not associated to a use
  #
  # POST /user/check_cards
  def check_card
    @card = Card.where(uid: params[:card], user_id: nil).first
    if @card
      head :ok
    else
      head :forbidden
    end
  end

  # Checks if credentials are valids
  #
  # POST /user/check_credentials
  def check_credentials
    @user = User.where(email: params[:email]).first
    if @user && @user.valid_password?(params[:password])
      head :ok
    else
      head :unauthorized
    end
  end

  private

  # Ensures user has access to the resource
  #
  # TODO: Limit access
  def ensure_user_has_rights
    redirect_to root_path unless current_user
  end

  # Sets the user object required by the action
  def set_user
    @user = User.find(params[:id])
  end

  # Filter the permitted params
  def user_params
    params.fetch(:user, {}).permit(:email, :first_name, :last_name, :address,
                                   :postal_code, :city, :phone_number)
  end
end

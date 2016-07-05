class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_has_rights, except: [:preform, :check_card]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('user.create.success') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  #TODO: Multi cards handling
  def update
    respond_to do |format|
      cards = []
      params[:user][:cards_attributes].each do |_, v|
        card = Card.where(uid: v[:uid]).first
        cards << card if card && v[:_destroy] == 'false'
      end
      @user.cards = cards.uniq
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('user.update.success') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

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
  # Try to find an existing user
  def preform
    @user = User.find_by(email: params[:email]) || User.new(email: params[:email])
    render partial: @user.persisted? ? 'form_password' : 'form_card_uid'
  end

  # Check if card is valid and not taken
  def check_card
    @card = Card.where(uid: params[:card], user_id: nil).first
    if @card
      head :ok
    else
      head :forbidden
    end
  end

  private

  def ensure_user_has_rights
    redirect_to root_path unless current_user && current_user == @user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.fetch(:user, {}).permit(:email, :first_name, :last_name, :address,
                                   :postal_code, :city, :phone_number)
  end
end

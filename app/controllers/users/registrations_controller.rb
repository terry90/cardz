# Handles the requests about users registations
class Users::RegistrationsController < Devise::RegistrationsController
  # Creates a user without password but with a card object assigned
  #
  # POST /resource
  def create
    ## Custom Code - BEGIN
    card = Card.where(uid: params[:user][:cards_attributes][:uid], user: nil)
    flash[:error] = t('errors.card.inexistent') unless card
    build_resource(sign_up_params)
    resource.cards << card if card
    resource.save
    ## Custom Code - END
    ## Devise code - BEGIN
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      @errors = resource.errors.messages.values.flatten
      render 'home/index'
    end
    ## Devise code - END
  end

  private

  # Filters the permitted params
  def sign_up_params
    params.require(:user).permit(:email, cards_attributes: [:id])
  end
end

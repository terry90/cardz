# Handles the requests about users confirmations
#
# It overrides Devise controller to customize its behaviour
class Users::ConfirmationsController < Devise::ConfirmationsController
  # Devise code
  def show
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token]) if params[:confirmation_token].present?
    super if resource.nil? or resource.confirmed?
  end

  # Devise code
  def confirm
    self.resource = resource_class.find_by_confirmation_token(params[resource_name][:confirmation_token]) if params[resource_name][:confirmation_token].present?
    if resource.update_attributes(permitted_params) && resource.password_match?
      self.resource = resource_class.confirm_by_token(params[resource_name][:confirmation_token])
      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, resource)
    else
      render action: 'show'
    end
  end

  private

  # Filters the permitted params
  def permitted_params
    params.require(resource_name).permit(:confirmation_token, :password, :password_confirmation)
  end
end